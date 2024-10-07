import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:ledger_l/domain/domain.dart';

part 'app_setting_state.dart';

part 'app_setting_cubit.freezed.dart';

///Later There will be localization May be or May be not

@singleton
class AppSettingCubit extends Cubit<AppSettingState> {
  final ThemeRepository _themeRepository;

  static const _defaultTheme = ThemeMode.dark;

  AppSettingCubit(this._themeRepository)
      : super(const AppSettingState(themeMode: _defaultTheme)) {
    initialize();
  }

  Future<void> initialize() async {
    final theme = await _themeRepository.getTheme();
    emit(state.copyWith(themeMode: theme));
  }

  Future<void> onChangeTheme(ThemeMode theme) async {
    await _themeRepository.setTheme(theme);
    emit(state.copyWith(themeMode: theme));

  }
}
