import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../presentation.dart';

part 'receiver_data_validation_state.dart';

part 'receiver_data_validation_cubit.freezed.dart';

@injectable
class ReceiverDataValidationCubit extends Cubit<ReceiverDataValidationState> {
  final GlobalKey<FormState> _formKey;
  final TextEditingController _textEditingController;
  final FocusNode _focusNode;

  ReceiverDataValidationCubit()
      : _formKey = GlobalKey<FormState>(),
        _textEditingController = TextEditingController(),
        _focusNode = FocusNode(),
        super(const ReceiverDataValidationState.initial());

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

  Future<void> onNextTap(BuildContext context) async {
    _focusNode.unfocus();
    if (_isValid()) {
      _onValidated?.call(_textEditingController.text);
      await Future.delayed($styles.time.fast);
    }
  }
}
