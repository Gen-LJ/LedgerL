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
      receiverId: json['receiverId'] as String,
      currencyType: json['currencyType'] as String,
      amount: json['amount'] as num,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$TransactionModelImplToJson(
        _$TransactionModelImpl instance) =>
    <String, dynamic>{
      'transactionId': instance.transactionId,
      'senderId': instance.senderId,
      'receiverId': instance.receiverId,
      'currencyType': instance.currencyType,
      'amount': instance.amount,
      'createdAt': instance.createdAt.toIso8601String(),
    };
