import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ledger_l/domain/domain.dart';

abstract interface class TransactionRepository {
  Future<TransactionStatusResponseEntity> balanceTransfer({
    required String senderId,
    required String senderEmail,
    required String receiverId,
    required String receiverEmail,
    required String currencyType,
    required int amount,
  });

  Future<PaginatedTransactionEntity> getTransactionByUser({required String userId,DocumentSnapshot? lastDocument});
}
