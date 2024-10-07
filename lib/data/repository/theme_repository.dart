
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:ledger_l/domain/domain.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/config/storage_config.dart';

@LazySingleton(as: ThemeRepository)
class ThemeRepositoryImpl implements ThemeRepository {
  final SharedPreferences sharedPreferences;

  const ThemeRepositoryImpl(this.sharedPreferences);

  static const _defaultTheme = ThemeMode.dark;

  ThemeMode _parseThemeMode(String source) {
    return switch (source) {
      'light' => ThemeMode.light,
      'dark' => ThemeMode.dark,
      _ => ThemeMode.system,
    };
  }

  @override
  Future<ThemeMode> getTheme() async {
    final source = sharedPreferences.getString(StorageConfig.themeModeKey);

    if (source == null) {
      setTheme(_defaultTheme);
      return _defaultTheme;
    }
    
    return _parseThemeMode(source);
  }

  @override
  Future<void> setTheme(ThemeMode theme) async {
    final themeString = theme.name;
    await sharedPreferences.setString(StorageConfig.themeModeKey, themeString);
  }

  @override
  Future<void> setIsNewInstall(bool isNewInstall) async {
    await sharedPreferences.setBool(StorageConfig.isNewInstallKey, isNewInstall);
  }

  @override
  Future<bool> getIsNewInstall() async {
    final source = sharedPreferences.getBool(StorageConfig.isNewInstallKey) ?? true;
    return source;
  }
}
