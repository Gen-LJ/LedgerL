// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionModelImpl _$$TransactionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionModelImpl(
      transactionId: json['transactionId'] as String,
      senderId: json['senderId'] as String,
      senderEmail: json['senderEmail'] as String,
      receiverId: json['receiverId'] as String,
      receiverEmail: json['receiverEmail'] as String,
      currencyType: json['currencyType'] as String,
      amount: (json['amount'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$TransactionModelImplToJson(
        _$TransactionModelImpl instance) =>
    <String, dynamic>{
      'transactionId': instance.transactionId,
      'senderId': instance.senderId,
      'senderEmail': instance.senderEmail,
      'receiverId': instance.receiverId,
      'receiverEmail': instance.receiverEmail,
      'currencyType': instance.currencyType,
      'amount': instance.amount,
      'createdAt': instance.createdAt.toIso8601String(),
    };
