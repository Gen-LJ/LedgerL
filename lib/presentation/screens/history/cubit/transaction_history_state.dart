part of 'transaction_history_cubit.dart';

@freezed
class TransactionHistoryState with _$TransactionHistoryState {
  const factory TransactionHistoryState.initial() = THistoryInitial;
  const factory TransactionHistoryState.ready({
    required List<TransactionEntity> transactions,
    required DocumentSnapshot lastDocument,
    @Default(false) bool loadingMore,
  }) = THistoryReady;
  const factory TransactionHistoryState.loading() = THistoryLoading;
  const factory TransactionHistoryState.error(String message) = THistoryError;
}
