part of 'transfer_view_cubit.dart';

@freezed
class TransferViewState with _$TransferViewState {
  const factory TransferViewState.initial() = TransferViewInitial;
  const factory TransferViewState.ready({
    required List<UserInfoEntity> walletUsers
}) = TransferViewReady;
  const factory TransferViewState.loading() = TransferViewLoading;
}
