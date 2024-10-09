import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ledger_l/core/core.dart';
import 'package:ledger_l/data/data.dart';
import 'package:logger/logger.dart';

abstract class TransactionRemoteDataSource {
  Future<StatusResponseModel> balanceTransfer({
    required String senderId,
    required String receiverId,
    required String currencyType,
    required num amount,
  });
}

class TransactionRemoteDataSourceImpl implements TransactionRemoteDataSource {
  final FirebaseFirestore _fireStore;
  final TransactionIdGenerator _transactionIdGenerator;
  final Logger logger;

  TransactionRemoteDataSourceImpl(
      this._fireStore, this.logger, this._transactionIdGenerator);

  @override
  Future<StatusResponseModel> balanceTransfer({
    required String senderId,
    required String receiverId,
    required String currencyType,
    required num amount,
  }) async {
    try {
      CollectionReference refTransaction =
          _fireStore.collection(FirebaseConfig.transactionCollectionKey);

      final transaction = TransactionModel(
        transactionId: _transactionIdGenerator.generate(),
        senderId: senderId,
        receiverId: receiverId,
        currencyType: currencyType,
        amount: amount,
        createdAt: DateTime.now(),
      );

      // Convert the transaction to a map for Firestore
      final transactionData = transaction.toFireStore();

      // Update or create the sender's document with the new transaction in the transaction list
      await refTransaction.doc(senderId).set({
        'userId': senderId,
        'transactions': FieldValue.arrayUnion([transactionData]),
        // Append the transaction to the list
      }, SetOptions(merge: true));

      // Update or create the receiver's document with the new transaction in the transaction list
      await refTransaction.doc(receiverId).set({
        'userId': receiverId,
        'transactions': FieldValue.arrayUnion([transactionData]),
        // Append the transaction to the list
      }, SetOptions(merge: true));

      // Return success response
      logger.i(transactionData);
      return const StatusResponseModel(
        status: true,
        message: 'Transaction success.',
      );
    } catch (e) {
      // Handle any errors and return a failure response
      logger.e(e);
      return StatusResponseModel(
        status: false,
        message: 'Transaction fail: $e',
      );
    }
  }
}
