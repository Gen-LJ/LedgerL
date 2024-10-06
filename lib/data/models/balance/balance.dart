import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ledger_l/domain/domain.dart';

part 'balance.freezed.dart';
part 'balance.g.dart';

@freezed
class BalanceModel extends BalanceEntity with _$BalanceModel {
  const factory BalanceModel({
    required String currency,
    required num amount,
  }) = _BalanceModel;

  factory BalanceModel.fromJson(Map<String, dynamic> json) =>
      _$BalanceModelFromJson(json);

  factory BalanceModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>; // Firestore document data
    return BalanceModel.fromJson(data);
  }
}