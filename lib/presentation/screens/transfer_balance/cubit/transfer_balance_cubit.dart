import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:ledger_l/core/core.dart';
import 'package:ledger_l/domain/domain.dart';
import '../../../presentation.dart';

part 'transfer_balance_state.dart';

part 'transfer_balance_cubit.freezed.dart';

@injectable
class TransferBalanceCubit extends Cubit<TransferBalanceState> {
  final TransactionRepository _transactionRepository;
  final AuthenticationCubit _auth;
  final TextEditingController _textEditingController;
  final FocusNode _focusNode;
  final INavigationKeyProvider _navigationKeyProvider;
  bool _hideAvailable = false;
  int _currentIndex = 0;

  TransferBalanceCubit(
      this._transactionRepository, this._auth, this._navigationKeyProvider)
      : _textEditingController = TextEditingController(),
        _focusNode = FocusNode(),
        super(const TransferBalanceState.initial());

  int get currentIndex => _currentIndex;

  TextEditingController get textEditingController => _textEditingController;

  FocusNode get focusNode => _focusNode;

  bool get hideAvailable => _hideAvailable;

  void onTapCurrency({required int index}) {
    _focusNode.unfocus();
    _textEditingController.text = '';
    _currentIndex = index;
    emit(state.maybeMap(initial: (state) {
      return state.copyWith(
        currentIndex: _currentIndex,
      );
    }, orElse: () {
      return TransferBalanceState.initial(
          currentIndex: _currentIndex, onHide: _hideAvailable);
    }));
  }

  void onHideAvailableBalance() {
    _hideAvailable = !_hideAvailable;
    emit(state.maybeMap(initial: (state) {
      return state.copyWith(onHide: _hideAvailable);
    }, orElse: () {
      return TransferBalanceState.initial(
          currentIndex: _currentIndex, onHide: _hideAvailable);
    }));
  }

  Future<void> onTapTransfer({
    required String receiverId,
    required String receiverEmail,
    required String currency,
  }) async {
    emit(const TransferBalanceState.loading());
    try {
      final response = await _transactionRepository.balanceTransfer(
          senderId: _auth.userId!,
          receiverId: receiverId,
          receiverEmail: receiverEmail,
          currencyType: currency,
          amount: int.parse(_textEditingController.text));
      response.status
          ? emit(TransferBalanceState.success(response.transactionData))
          : throw ServerFailure(response.message);
    } catch (e) {
      debugPrint('Error at try catch');
      String? reason;
      if(e is FormatException){
        reason = "Transferring fractional amounts is not allowed.";
      } else if(e is Exception) {
        reason = e.toString();
      } else {
        Failure failure = e as Failure;
        reason = failure.reason;
      }

      final context = _navigationKeyProvider.globalKey.currentState!.context;
      if (context.mounted) {
        showDialog(
            context: context,
            builder: (context) {
              return ErrorDialog(reason: reason ?? 'Something went Wrong!!!');
            });
      }
      emit(TransferBalanceState.initial(
          currentIndex: _currentIndex, onHide: _hideAvailable));
    }
  }
}
