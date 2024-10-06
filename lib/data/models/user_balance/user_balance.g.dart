// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_balance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserBalanceModelImpl _$$UserBalanceModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserBalanceModelImpl(
      id: json['id'] as String,
      balance: (json['balance'] as List<dynamic>)
          .map((e) => BalanceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UserBalanceModelImplToJson(
        _$UserBalanceModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'balance': instance.balance,
    };
