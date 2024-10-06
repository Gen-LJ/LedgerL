import 'package:ledger_l/domain/entities/balance.dart';

class UserBalanceEntity {
  final String id;
  final List<BalanceEntity> balance;

  UserBalanceEntity({required this.id,required this.balance});
}