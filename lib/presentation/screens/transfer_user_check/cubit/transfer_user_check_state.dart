part of 'transfer_user_check_cubit.dart';

@freezed
class TransferUserCheckState with _$TransferUserCheckState {
  const factory TransferUserCheckState.initial() = TransferUserCheckInitial;
  const factory TransferUserCheckState.success({
    required UserInfoEntity receiverInfo,
    required List<BalanceEntity> senderBalance,
}) = TransferUserCheckSuccess;
  const factory TransferUserCheckState.loading() = TransferUserCheckLoading;
  const factory TransferUserCheckState.fail(Failure failure) = TransferUserCheckFail;
}
