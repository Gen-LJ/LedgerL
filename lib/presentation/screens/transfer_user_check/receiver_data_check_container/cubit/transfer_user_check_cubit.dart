import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'transfer_user_check_state.dart';
part 'transfer_user_check_cubit.freezed.dart';

@injectable
class TransferUserCheckCubit extends Cubit<TransferUserCheckState> {
  final GlobalKey<FormState> _formKey;
  final TextEditingController _textEditingController;
  final FocusNode _focusNode;


  TransferUserCheckCubit() : _formKey = GlobalKey<FormState>(),
        _textEditingController = TextEditingController(),
        _focusNode = FocusNode(),super(const TransferUserCheckState.initial());


  set onValidated(void Function(String input)? value) {
    _onValidated = value;
  }

  void Function(String input)? _onValidated;
  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get textEditingController => _textEditingController;
  FocusNode get focusNode => _focusNode;

  bool _isValid() {
    return _formKey.currentState?.validate() == true;
  }

  void onNextTap(BuildContext context) {
    if (_isValid()) {
      _onValidated?.call(_textEditingController.text);
    }
  }
}
