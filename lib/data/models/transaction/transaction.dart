import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ledger_l/domain/domain.dart';


part 'transaction.freezed.dart';

part 'transaction.g.dart';

@freezed
class TransactionModel extends TransactionEntity with _$TransactionModel {
  const factory TransactionModel({
    required String transactionId,
    required String senderId,
    required String senderName,
    required String senderEmail,
    required String receiverId,
    required String receiverName,
    required String receiverEmail,
    required String currencyType,
    required int amount,
    required DateTime createdAt,
  }) = _TransactionModel;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);

  factory TransactionModel.fromFireStore(Map<String, dynamic> json) {
    return TransactionModel(
      transactionId: json['id'] as String? ?? '', // Handle null
      currencyType: json['currencyType'] as String? ?? '', // Handle null
      senderId: json['senderId'] as String? ?? '', // Handle null
      senderName: json['senderName'] as String? ?? '', // Handle null
      senderEmail: json['senderEmail'] as String? ?? '', // Handle null
      amount: json['amount'] as int? ?? 0, // Handle null
      receiverId: json['receiverId'] as String? ?? '', // Handle null
      receiverName: json['receiverName'] as String? ?? '', // Handle null
      receiverEmail: json['receiverEmail'] as String? ?? '', // Handle null
      createdAt: (json['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(), // Handle null
    );
  }

}


extension TransactionModelExtension on TransactionModel {

  Map<String, dynamic> toFireStore() {
    return {
      'id': transactionId,
      'senderId': senderId,
      'senderName': senderName,
      'senderEmail': senderEmail,
      'receiverId': receiverId,
      'receiverName': receiverName,
      'receiverEmail': receiverEmail,
      'currencyType': currencyType,
      'amount': amount,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }

}
