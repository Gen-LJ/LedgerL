import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:ledger_l/core/core.dart';
import 'package:ledger_l/domain/domain.dart';
import '../../../presentation.dart';

part 'transfer_user_check_state.dart';

part 'transfer_user_check_cubit.freezed.dart';

@injectable
class TransferUserCheckCubit extends Cubit<TransferUserCheckState> {
  final UserRepository _userRepository;
  final BalanceRepository _balanceRepository;
  final AuthenticationCubit _auth;

  TransferUserCheckCubit(
      this._userRepository, this._balanceRepository, this._auth)
      : super(const TransferUserCheckState.initial());

  Future<void> checkForTransfer(String email) async {
    emit(const TransferUserCheckState.loading());
    try {
      final receiverData = await _userRepository.getUserInfo(email);
      final senderBalance =
          await _balanceRepository.getAllBalance(_auth.userId!);
      emit(TransferUserCheckState.success(
        receiverInfo: receiverData,
        senderBalance: senderBalance,
      ));
    } catch (e) {
      Failure failure = ServerFailure(e.toString());
      emit(TransferUserCheckState.fail(failure));
    }
  }
}
