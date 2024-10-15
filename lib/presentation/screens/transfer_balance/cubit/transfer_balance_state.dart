part of 'transfer_balance_cubit.dart';

@freezed
class TransferBalanceState with _$TransferBalanceState {
  const factory TransferBalanceState.initial({
    @Default(0) int currentIndex,
    @Default(false) bool onHide,
  }) = TransferInitial;
  const factory TransferBalanceState.loading() = TransferLoading;
  const factory TransferBalanceState.success(TransactionEntity transactionData) = TransferSuccess;
  const factory TransferBalanceState.fail(String errorMessage) = TransferFail;
}
