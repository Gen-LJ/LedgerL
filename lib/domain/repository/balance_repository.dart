import 'package:ledger_l/domain/domain.dart';

abstract interface class BalanceRepository{
  Future<List<BalanceEntity>> getAllBalance(String userId);
}