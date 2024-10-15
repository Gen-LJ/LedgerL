import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ledger_l/domain/domain.dart';

import '../entities/paginated_transaction.dart';

abstract interface class TransactionRepository {
  Future<TransactionStatusResponseEntity> balanceTransfer({
    required String senderId,
    required String receiverId,
    required String currencyType,
    required num amount,
  });

  Future<PaginatedTransactionEntity> getTransactionByUser({required String userId,DocumentSnapshot? lastDocument});
}
