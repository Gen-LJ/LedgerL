import 'package:cloud_firestore/cloud_firestore.dart';
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

        List<dynamic> senderBalanceList = senderData['balance'] ?? [];
        BalanceModel? senderBalance = senderBalanceList
            .map((balanceData) => BalanceModel.fromJson(balanceData as Map<String, dynamic>))
            .firstWhere((balance) => balance.currency == currencyType);

        if (senderBalance.amount < amount) {
          throw Exception('Insufficient balance');
        }


        final receiverData = receiverSnapshot.data() as Map<String, dynamic>;
        List<dynamic> receiverBalanceList = receiverData['balance'] ?? [];
        BalanceModel? receiverBalance = receiverBalanceList
            .map((balanceData) => BalanceModel.fromJson(balanceData as Map<String, dynamic>))
            .firstWhere((balance) => balance.currency == currencyType, orElse: () => BalanceModel(currency: currencyType, amount: 0));

        // Update sender balance
        transaction.update(senderRef, {
          'balance': FieldValue.arrayRemove([senderBalance.toJson()]), // Remove old balance
        });

        // Update sender's balance amount
        senderBalance = senderBalance.copyWith(amount: senderBalance.amount - amount);
        transaction.update(senderRef, {
          'balance': FieldValue.arrayUnion([senderBalance.toJson()]), // Add updated balance
        });

        // Update receiver balance
        transaction.update(receiverRef, {
          'balance': FieldValue.arrayRemove([receiverBalance.toJson()]), // Remove old balance
        });

        receiverBalance = receiverBalance.copyWith(amount: receiverBalance.amount + amount);
        transaction.update(receiverRef, {
          'balance': FieldValue.arrayUnion([receiverBalance.toJson()]), // Add updated balance
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
        message: 'Failed: ${e.toString().replaceAll('Exception:', '')}',
        transactionData: transactionModel,
      );
    }
  }
}
