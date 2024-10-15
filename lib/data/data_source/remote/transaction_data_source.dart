import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:ledger_l/core/core.dart';
import 'package:ledger_l/data/data.dart';
import 'package:logger/logger.dart';

abstract class TransactionRemoteDataSource {
  Future<TransactionStatusResponseModel> balanceTransfer({
    required String senderId,
    required String receiverId,
    required String currencyType,
    required num amount,
  });

  Future<List<TransactionModel>> getTransactionsByUserId(String userId);
}

@LazySingleton(as: TransactionRemoteDataSource)
class TransactionRemoteDataSourceImpl implements TransactionRemoteDataSource {
  final FirebaseFirestore _fireStore;
  final ITransactionIdGenerator _transactionIdGenerator;
  final Logger logger;

  TransactionRemoteDataSourceImpl(this._fireStore, this.logger, this._transactionIdGenerator);

  @override
  Future<TransactionStatusResponseModel> balanceTransfer({
    required String senderId,
    required String receiverId,
    required String currencyType,
    required num amount,
  }) async {
    final DateTime createdAt = DateTime.now();
    final Timestamp modifiedAt = Timestamp.fromDate(createdAt);

    final transactionModel = TransactionModel(
      transactionId: _transactionIdGenerator.generate(),
      senderId: senderId,
      receiverId: receiverId,
      currencyType: currencyType,
      amount: amount,
      createdAt: createdAt,
    );

    try {

      DocumentReference senderRef = _fireStore
          .collection(FirebaseConfig.balanceCollectionKey)
          .doc(senderId);
      DocumentReference receiverRef = _fireStore
          .collection(FirebaseConfig.balanceCollectionKey)
          .doc(receiverId);

      await _fireStore.runTransaction((transaction) async {
        DocumentSnapshot senderSnapshot = await transaction.get(senderRef);
        DocumentSnapshot receiverSnapshot = await transaction.get(receiverRef);

        if (!senderSnapshot.exists) {
          throw Exception('Sender document does not exist');
        }
        if (!receiverSnapshot.exists) {
          throw Exception('Receiver document does not exist');
        }

        // Extract sender's balance as a map
        final senderData = senderSnapshot.data() as Map<String, dynamic>;
        Map<String, dynamic> senderBalanceMap =
        Map<String, dynamic>.from(senderData['balance'] ?? {});

        num senderBalance = senderBalanceMap[currencyType] ?? 0;

        if (senderBalance < amount) {
          throw Exception('Insufficient balance');
        }

        // Extract receiver's balance as a map
        final receiverData = receiverSnapshot.data() as Map<String, dynamic>;
        Map<String, dynamic> receiverBalanceMap =
        Map<String, dynamic>.from(receiverData['balance'] ?? {});

        receiverBalanceMap[currencyType] ?? 0;

        // Update sender's balance by decrementing the amount
        transaction.update(senderRef, {
          'balance.$currencyType': FieldValue.increment(-amount),
          'modifiedAt': modifiedAt,
        });

        // Update receiver's balance by incrementing the amount
        transaction.update(receiverRef, {
          'balance.$currencyType': FieldValue.increment(amount),
          'modifiedAt': modifiedAt,
        });

        // Create a transaction document in the sender's transactions subcollection
        transaction.set(
          _fireStore.collection(FirebaseConfig.transactionCollectionKey)
              .doc(senderId).collection('transactions').doc(transactionModel.transactionId),
          transactionModel.toFireStore(), // Assuming you have a method to convert to Firestore format
        );

        // Optionally, you can also store the transaction in the receiver's transaction subcollection
        transaction.set(
          _fireStore.collection(FirebaseConfig.transactionCollectionKey)
              .doc(receiverId)
              .collection('transactions')
              .doc(transactionModel.transactionId),
          transactionModel.toFireStore(),
        );
      });

      logger.i('Transaction successful');
      return TransactionStatusResponseModel(
        status: true,
        message: 'Transaction success.',
        transactionData: transactionModel,
      );
    } catch (e) {
      logger.e(e);
      return TransactionStatusResponseModel(
        status: false,
        message: 'Failed: ${e.toString().replaceAll('Exception:', '')}',
        transactionData: transactionModel,
      );
    }
  }


  @override
  Future<List<TransactionModel>> getTransactionsByUserId(String userId) async {
    try {
      final transactionsRef = _fireStore
          .collection(FirebaseConfig.transactionCollectionKey)
          .doc(userId)
          .collection('transactions');

      debugPrint('Fetching transactions from: ${transactionsRef.path}'); // Log the path

      final snapshot = await transactionsRef.orderBy('createdAt', descending: true).get();

      debugPrint('snapshot = $snapshot');

      // Check if there are any documents in the snapshot
      if (snapshot.docs.isEmpty) {
        debugPrint('No transactions found for user: $userId');
        return []; // Return an empty list if no transactions are found
      }

      // Convert the snapshot to a list of TransactionModel using fromJson
      final transactions = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>?; // Ensure it's of the right type
        if (data == null) {
          throw Exception('Document data is null for document ID: ${doc.id}');
        }

        debugPrint('Transaction data = $data');
        // Set transactionId to doc.id and then create TransactionModel from JSON
        data['transactionId'] = doc.id; // Add transactionId to the data map
        return TransactionModel.fromFireStore(data);
      }).toList();

      logger.i(transactions);
      return transactions;
    } catch (e) {
      logger.e('Failed to fetch transactions: $e');
      throw Exception('Failed to fetch transactions for user $userId');
    }
  }



}
