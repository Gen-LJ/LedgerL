import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:ledger_l/core/core.dart';
import 'package:ledger_l/domain/domain.dart';
import 'package:ledger_l/presentation/blocs/authentication/authentication_cubit.dart';

part 'transfer_balance_state.dart';

part 'transfer_balance_cubit.freezed.dart';

@injectable
class TransferBalanceCubit extends Cubit<TransferBalanceState> {
  final TransactionRepository _transactionRepository;
  final AuthenticationCubit _auth;
  final TextEditingController _textEditingController;
  final FocusNode _focusNode;
  bool _hideAvailable = false;
  int _currentIndex = 0;
  BalanceEntity? _currency;

  TransferBalanceCubit(this._transactionRepository, this._auth)
      : _textEditingController = TextEditingController(),
        _focusNode = FocusNode(),
        super(const TransferBalanceState.initial());

  int get currentIndex => _currentIndex;

  BalanceEntity? get currency => _currency;

  TextEditingController get textEditingController => _textEditingController;

  FocusNode get focusNode => _focusNode;

  bool get hideAvailable => _hideAvailable;

  void onTapCurrency({required int index, required BalanceEntity currency}) {
    _focusNode.unfocus();
    _textEditingController.text = '';
    _currentIndex = index;
    _currency = currency;
    emit(state.maybeMap(initial: (state) {
      return state.copyWith(currentIndex: _currentIndex, currency: _currency);
    }, orElse: () {
      return state;
    }));
  }

  void onHideAvailableBalance() {
    _hideAvailable = !_hideAvailable;
    emit(state.maybeMap(initial: (state) {
      return state.copyWith(onHide: _hideAvailable);
    }, orElse: () {
      return state;
    }));
  }

  Future<void> onTapTransfer({
    required String receiverId,
    required String currency,
  }) async {
    emit(const TransferBalanceState.loading());
    try {
      final response = await _transactionRepository.balanceTransfer(
          senderId: _auth.userId!,
          receiverId: receiverId,
          currencyType: currency,
          amount: num.parse(_textEditingController.text));
      response.status?
      emit(const TransferBalanceState.success()) : emit(TransferBalanceState.fail(response.message));
    } catch (e) {
      Failure failure = e as Failure;
      emit(TransferBalanceState.fail(failure.reason));
    }
  }
}
