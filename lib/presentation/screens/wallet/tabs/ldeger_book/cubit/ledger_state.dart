part of 'ledger_cubit.dart';

@freezed
class LedgerState with _$LedgerState {
  const factory LedgerState.initial() = LedgerInitial;
  const factory LedgerState.ready({
    required List<BalanceEntity> allBalance
}) = LedgerReady;
  const factory LedgerState.loading() = LedgerLoading;
}
