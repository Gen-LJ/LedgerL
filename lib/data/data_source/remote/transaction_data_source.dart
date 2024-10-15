import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:ledger_l/core/core.dart';
import 'package:ledger_l/data/data.dart';
import 'package:logger/logger.dart';

import '../../models/paginated_transactions/paginated_transaction.dart';

abstract class TransactionRemoteDataSource {
  Future<TransactionStatusResponseModel> balanceTransfer({
    required String senderId,
    required String receiverId,
    required String receiverEmail,
    required String currencyType,
    required int amount,
  });

  Future<PaginatedTransactionModel> getTransactionsByUserId(
      String userId, {
        int limit = 10,
        DocumentSnapshot? lastDocument, // Used for pagination
      });
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
    required String receiverEmail,
    required String currencyType,
    required int amount,
  }) async {
    final DateTime createdAt = DateTime.now();
    final Timestamp modifiedAt = Timestamp.fromDate(createdAt);

    final transactionModel = TransactionModel(
      transactionId: _transactionIdGenerator.generate(),
      senderId: senderId,
      receiverId: receiverId,
      receiverEmail: receiverEmail,
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
  Future<PaginatedTransactionModel> getTransactionsByUserId(
      String userId, {
        int limit = 10,
        DocumentSnapshot? lastDocument, // Used for pagination
      }) async {
    try {
      final transactionsRef = _fireStore
          .collection(FirebaseConfig.transactionCollectionKey)
          .doc(userId)
          .collection('transactions');

      debugPrint('Fetching transactions from: ${transactionsRef.path}'); // Log the path

      // Start building the query
      Query query = transactionsRef.orderBy('createdAt', descending: true).limit(limit);

      // If `lastDocument` is provided, use it for pagination
      if (lastDocument != null) {
        query = query.startAfterDocument(lastDocument);
      }

      final snapshot = await query.get();

      debugPrint('snapshot = $snapshot');

      // Check if there are any documents in the snapshot
      if (snapshot.docs.isEmpty) {
        debugPrint('No transactions found for user: $userId');
        throw Exception('No transactions found for user: $userId');// Return an empty list if no transactions are found
      }

      // Convert the snapshot to a list of TransactionModel using fromJson
      final transactions = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>?; // Ensure it's of the right type
        if (data == null) {
          throw Exception('Document data is null for document ID: ${doc.id}');
        }

        // Set transactionId to doc.id and then create TransactionModel from JSON
        data['transactionId'] = doc.id; // Add transactionId to the data map
        return TransactionModel.fromFireStore(data);
      }).toList();

      // Get the last document in the snapshot to use for pagination
      final lastDoc = snapshot.docs.isNotEmpty ? snapshot.docs.last : null;

      // Logging the results for debugging
      logger.i(transactions);

      return PaginatedTransactionModel(transactions: transactions, lastDocument: lastDoc!);
    } catch (e) {
      logger.e(e);
      throw ServerException(message: 'Failed: ${e.toString().replaceAll('Exception:', '')}');
    }
  }




}
