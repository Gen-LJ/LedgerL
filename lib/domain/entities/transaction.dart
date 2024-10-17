class TransactionEntity {
  final String transactionId;
  final String senderId;
  final String senderEmail;
  final String receiverId;
  final String receiverEmail;
  final String currencyType;
  final int amount;
  final DateTime createdAt;

  TransactionEntity({
    required this.transactionId,
    required this.senderId,
    required this.senderEmail,
    required this.receiverId,
    required this.receiverEmail,
    required this.currencyType,
    required this.amount,
    required this.createdAt,
  });
}
