import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ledger_l/core/core.dart';
import 'package:ledger_l/presentation/presentation.dart';

extension NavigationExtension on BuildContext {
  void goIndex() => go(IndexScreen.routePath);

  void goHome() {
    final router = inject<NavigationRouter>();
    final selectTab = router.useIndexPageNavigator();
    selectTab(0);
    goIndex();
  }

  void goHistory() {
    final router = inject<NavigationRouter>();
    final selectTab = router.useIndexPageNavigator();
    selectTab(1);
    goIndex();
  }

  void goProfile() {
    final router = inject<NavigationRouter>();
    final selectTab = router.useIndexPageNavigator();
    selectTab(2);
    goIndex();
  }

  void pushTransferUserCheck() => push(TransferUserCheckScreen.routePath);
}
