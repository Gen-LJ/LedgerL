import 'package:cloud_firestore/cloud_firestore.dart';
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
}

class TransactionRemoteDataSourceImpl implements TransactionRemoteDataSource {
  final FirebaseFirestore _fireStore;
  final TransactionIdGenerator _transactionIdGenerator;
  final Logger logger;

  TransactionRemoteDataSourceImpl(this._fireStore, this.logger,
      this._transactionIdGenerator);

  @override
  Future<TransactionStatusResponseModel> balanceTransfer({
    required String senderId,
    required String receiverId,
    required String currencyType,
    required num amount,
  }) async {
    final transactionModel = TransactionModel(
      transactionId: _transactionIdGenerator.generate(),
      senderId: senderId,
      receiverId: receiverId,
      currencyType: currencyType,
      amount: amount,
      createdAt: DateTime.now(),
    );

    try {
      CollectionReference refTransaction =
      _fireStore.collection(FirebaseConfig.transactionCollectionKey);
      DocumentReference senderRef = _fireStore
          .collection(FirebaseConfig.balanceCollectionKey)
          .doc(senderId);
      DocumentReference receiverRef = _fireStore
          .collection(FirebaseConfig.balanceCollectionKey)
          .doc(receiverId);

      // Firestore transaction ensures atomic updates
      await _fireStore.runTransaction((transaction) async {
        // Fetch sender's balance inside the transaction
        DocumentSnapshot senderSnapshot = await transaction.get(senderRef);
        BalanceModel senderBalance = BalanceModel.fromFirestore(senderSnapshot);
        if (senderBalance.currency != currencyType || senderBalance.amount < amount) {
          throw Exception('Insufficient balance');
        }

        // Fetch receiver's balance inside the transaction
        DocumentSnapshot receiverSnapshot = await transaction.get(receiverRef);
        BalanceModel receiverBalance = receiverSnapshot.exists
            ? BalanceModel.fromFirestore(receiverSnapshot)
            : BalanceModel(currency: currencyType, amount: 0); // Default if no balance

        // Update balances atomically
        transaction.update(senderRef, {
          'amount': senderBalance.amount - amount,
        });
        transaction.update(receiverRef, {
          'amount': receiverBalance.amount + amount,
        });

        // Add the transaction to both sender and receiver's transaction history
        final transactionData = transactionModel.toFireStore();
        transaction.set(refTransaction.doc(senderId), {
          'userId': senderId,
          'transactions': FieldValue.arrayUnion([transactionData]),
        }, SetOptions(merge: true));

        transaction.set(refTransaction.doc(receiverId), {
          'userId': receiverId,
          'transactions': FieldValue.arrayUnion([transactionData]),
        }, SetOptions(merge: true));
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
        message: 'Transaction failed: $e',
        transactionData: transactionModel,
      );
    }
  }
}
