import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ledger_l/core/core.dart';
import 'package:ledger_l/presentation/presentation.dart';

extension NavigationExtension on BuildContext {
  void goIndex() => go(IndexScreen.routePath);

  void goHistory() => go("/?tab=1");

  void goIndexAndSelectTab(int index) {
    go("/?tab=$index");
    final router = inject<NavigationRouter>();
    final selectTab = router.useIndexPageNavigator();
    selectTab(index);
  }

  void pushTransferUserCheck() => push(TransferUserCheckScreen.routePath);


}