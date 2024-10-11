import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ledger_l/data/data.dart';
import 'package:ledger_l/domain/domain.dart';


part 'transaction_status_response.freezed.dart';

part 'transaction_status_response.g.dart';

@freezed
class TransactionStatusResponseModel extends TransactionStatusResponseEntity with _$TransactionStatusResponseModel {
  const factory TransactionStatusResponseModel({
    required bool status,
    required String message,
    required TransactionModel transactionData
  }) = _TransactionStatusResponseModel;

  factory TransactionStatusResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionStatusResponseModelFromJson(json);
}