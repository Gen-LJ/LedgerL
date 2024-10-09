import 'package:ledger_l/domain/domain.dart';

abstract interface class TransactionRepository {
  Future<StatusResponseEntity> balanceTransfer({
    required String senderId,
    required String receiverId,
    required String currencyType,
    required num amount,
  });
}
