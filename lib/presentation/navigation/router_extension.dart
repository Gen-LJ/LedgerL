import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ledger_l/core/core.dart';
import 'package:ledger_l/domain/domain.dart';
import 'package:ledger_l/presentation/presentation.dart';

extension NavigationExtension on BuildContext {
  void goIndex() => go(IndexScreen.routePath);

  void goHome() {
    final router = inject<NavigationRouter>();
    final selectTab = router.useIndexPageNavigator();
    selectTab(0);
    goIndex();
  }

  void goTransferSuccess(TransactionEntity transactionData)=> go(TransferSuccessScreen.routePath,extra: transactionData);

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

  void pushTransferBalance({
    required List<BalanceEntity> senderBalance,
    required UserInfoEntity receiverInfo,
  }) =>
      push(TransferBalanceScreen.routePath, extra: [senderBalance,receiverInfo]);
}
