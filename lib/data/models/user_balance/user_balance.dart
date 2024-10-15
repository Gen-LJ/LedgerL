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

    // Extract the balance as a map
    Map<String, dynamic> balanceMap = data['balance'] as Map<String, dynamic>;

    // Convert the map entries into a list of BalanceModel
    List<BalanceModel> balanceList = balanceMap.entries
        .map((entry) => BalanceModel(
      currency: entry.key,
      amount: entry.value as num,
    ))
        .toList();

    return UserBalanceModel(
      id: data['id'] as String,
      balance: balanceList,
    );
  }
}
