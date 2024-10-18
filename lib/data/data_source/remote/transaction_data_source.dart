import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:ledger_l/core/core.dart';
import 'package:ledger_l/data/data.dart';
import 'package:logger/logger.dart';

abstract class TransactionRemoteDataSource {
  Future<TransactionStatusResponseModel> balanceTransfer({
    required String senderId,
    required String senderName,
    required String senderEmail,
    required String receiverId,
    required String receiverName,
    required String receiverEmail,
    required String currencyType,
    required int amount,
  });

  Future<PaginatedTransactionModel> getTransactionsByUserId(
    String userId, {
    int limit = 10,
    DocumentSnapshot? lastDocument,
  });
}

@LazySingleton(as: TransactionRemoteDataSource)
class TransactionRemoteDataSourceImpl implements TransactionRemoteDataSource {
  final FirebaseFirestore _fireStore;
  final ITransactionIdGenerator _transactionIdGenerator;
  final Logger logger;

  TransactionRemoteDataSourceImpl(
      this._fireStore, this.logger, this._transactionIdGenerator);

  @override
  Future<TransactionStatusResponseModel> balanceTransfer({
    required String senderId,
    required String senderName,
    required String senderEmail,
    required String receiverId,
    required String receiverName,
    required String receiverEmail,
    required String currencyType,
    required int amount,
  }) async {
    final DateTime createdAt = DateTime.now();
    final Timestamp modifiedAt = Timestamp.fromDate(createdAt);

    final transactionModel = TransactionModel(
      transactionId: _transactionIdGenerator.generate(),
      senderId: senderId,
      senderName: senderName,
      senderEmail: senderEmail,
      receiverId: receiverId,
      receiverName: receiverName,
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

        final senderData = senderSnapshot.data() as Map<String, dynamic>;
        Map<String, dynamic> senderBalanceMap =
            Map<String, dynamic>.from(senderData['balance'] ?? {});

        num senderBalance = senderBalanceMap[currencyType] ?? 0;

        if (senderBalance < amount) {
          throw Exception('Insufficient balance');
        }

        final receiverData = receiverSnapshot.data() as Map<String, dynamic>;
        Map<String, dynamic> receiverBalanceMap =
            Map<String, dynamic>.from(receiverData['balance'] ?? {});

        receiverBalanceMap[currencyType] ?? 0;

        transaction.update(senderRef, {
          'balance.$currencyType': FieldValue.increment(-amount),
          'modifiedAt': modifiedAt,
        });

        transaction.update(receiverRef, {
          'balance.$currencyType': FieldValue.increment(amount),
          'modifiedAt': modifiedAt,
        });

        transaction.set(
          _fireStore
              .collection(FirebaseConfig.transactionCollectionKey)
              .doc(senderId)
              .collection('transactions')
              .doc(transactionModel.transactionId),
          transactionModel
              .toFireStore(),
        );

        transaction.set(
          _fireStore
              .collection(FirebaseConfig.transactionCollectionKey)
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
    DocumentSnapshot? lastDocument,
  }) async {
    try {
      final transactionsRef = _fireStore
          .collection(FirebaseConfig.transactionCollectionKey)
          .doc(userId)
          .collection('transactions');

      Query query =
          transactionsRef.orderBy('createdAt', descending: true).limit(limit);

      if (lastDocument != null) {
        query = query.startAfterDocument(lastDocument);
      }

      final snapshot = await query.get();

      if (snapshot.docs.isEmpty) {
        throw Exception(
            'No transactions found for user: $userId'); // Return an empty list if no transactions are found
      }

      final transactions = snapshot.docs.map((doc) {
        final data = doc.data()
            as Map<String, dynamic>?;
        if (data == null) {
          throw Exception('Document data is null for document ID: ${doc.id}');
        }
        return TransactionModel.fromFireStore(data);
      }).toList();

      final lastDoc = snapshot.docs.isNotEmpty ? snapshot.docs.last : null;

      logger.i(transactions);

      return PaginatedTransactionModel(
          transactions: transactions, lastDocument: lastDoc!);
    } catch (e) {
      logger.e(e);
      throw ServerException(
          message: 'Failed: ${e.toString().replaceAll('Exception:', '')}');
    }
  }
}
