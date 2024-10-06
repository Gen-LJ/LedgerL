import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ledger_l/data/data.dart';

import '../../../domain/domain.dart';

part 'user_balance.freezed.dart';

part 'user_balance.g.dart';

@freezed
class UserBalanceModel extends UserBalanceEntity with _$UserBalanceModel {
  const factory UserBalanceModel({
    required String id,
    required List<BalanceModel> balance,
  }) = _UserBalanceModel;

  factory UserBalanceModel.fromJson(Map<String, dynamic> json) =>
      _$UserBalanceModelFromJson(json);

  factory UserBalanceModel.fromFireStore(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return UserBalanceModel(
      id: data['id'] as String,
      balance: List<Map<String, dynamic>>.from(snapshot.get('balance'))
          .map((item) => BalanceModel.fromJson(item))
          .toList(),
    );
  }
}
