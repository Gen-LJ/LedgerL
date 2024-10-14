import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:ledger_l/domain/domain.dart';

part 'transfer_balance_state.dart';

part 'transfer_balance_cubit.freezed.dart';

@injectable
class TransferBalanceCubit extends Cubit<TransferBalanceState> {
  int _currentIndex = 0;
  BalanceEntity? _currency;
  final TextEditingController _textEditingController;
  final FocusNode _focusNode;
  bool _hideAvailable = false;

  TransferBalanceCubit()
      : _textEditingController = TextEditingController(),
        _focusNode = FocusNode(),
        super(const TransferBalanceState.initial(0, null,false));

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
    emit(state.copyWith(currentIndex: _currentIndex, currency: currency));
  }

  void onHideAvailableBalance() {
    _hideAvailable = !_hideAvailable;
    emit(state.copyWith(onHide: _hideAvailable));
  }

  Future<void> onTapTransfer() async {}
}
