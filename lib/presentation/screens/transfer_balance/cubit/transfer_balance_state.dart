part of 'transfer_balance_cubit.dart';

@freezed
class TransferBalanceState with _$TransferBalanceState {
  const factory TransferBalanceState.initial(int currentIndex,BalanceEntity? currency) = _Initial;
}
