

class TransactionEntity {
  final String transactionId;
  final String senderId;
  final String receiverId;
  final String currencyType;
  final num amount;
  final DateTime createdAt;

  TransactionEntity({
    required this.transactionId,
    required this.senderId,
    required this.receiverId,
    required this.currencyType,
    required this.amount,
    required this.createdAt,
  });
}
