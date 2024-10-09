part of 'transfer_cubit.dart';

@freezed
class TransferState with _$TransferState {
  const factory TransferState.initial() = TransferInitial;
  const factory TransferState.ready({
    required List<UserInfoEntity> walletUsers
}) = TransferReady;
  const factory TransferState.loading() = TransferLoading;
}
