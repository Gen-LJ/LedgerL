import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ledger_l/presentation/presentation.dart';

extension NavigationExtension on BuildContext {
  void goIndex() => go(IndexScreen.routePath);
}