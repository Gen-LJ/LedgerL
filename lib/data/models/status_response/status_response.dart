import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ledger_l/domain/domain.dart';


part 'status_response.freezed.dart';

part 'status_response.g.dart';

@freezed
class StatusResponseModel extends StatusResponseEntity with _$StatusResponseModel {
  const factory StatusResponseModel({
    required bool status,
    required String message,
  }) = _StatusResponseModel;

  factory StatusResponseModel.fromJson(Map<String, dynamic> json) =>
      _$StatusResponseModelFromJson(json);
}