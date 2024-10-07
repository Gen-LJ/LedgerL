
import 'package:flutter/material.dart';

abstract class ThemeRepository {
  Future<ThemeMode> getTheme();
  Future<void> setTheme(ThemeMode theme);
  Future<void> setIsNewInstall(bool isNewInstall);
  Future<bool> getIsNewInstall();
}
