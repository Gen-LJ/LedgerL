// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StatusResponseModelImpl _$$StatusResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StatusResponseModelImpl(
      status: json['status'] as bool,
      message: json['message'] as String,
    );

Map<String, dynamic> _$$StatusResponseModelImplToJson(
        _$StatusResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
