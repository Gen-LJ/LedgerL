import 'package:ledger_l/domain/domain.dart';

class TransactionStatusResponseEntity extends StatusResponseEntity {
  final TransactionEntity transactionData;

  TransactionStatusResponseEntity({
    required super.status,
    required super.message,
    required this.transactionData,
  });
}
