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
    required String receiverId,
    required String currencyType,
    required num amount,
    required DateTime createdAt,
  }) = _TransactionModel;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);

}


extension TransactionModelExtension on TransactionModel {

  Map<String, dynamic> toFireStore() {
    return {
      'id': transactionId,
      'senderId': senderId,
      'receiverId': receiverId,
      'currencyType': currencyType,
      'amount': amount,
      'timestamp': Timestamp.fromDate(createdAt),
    };
  }

}
