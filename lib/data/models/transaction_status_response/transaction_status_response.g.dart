// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_status_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionStatusResponseModelImpl
    _$$TransactionStatusResponseModelImplFromJson(Map<String, dynamic> json) =>
        _$TransactionStatusResponseModelImpl(
          status: json['status'] as bool,
          message: json['message'] as String,
          transactionData: TransactionModel.fromJson(
              json['transactionData'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$TransactionStatusResponseModelImplToJson(
        _$TransactionStatusResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'transactionData': instance.transactionData,
    };
