import 'package:flutter/material.dart';
import 'package:ledger_l/domain/domain.dart';
import 'package:ledger_l/presentation/presentation.dart';

class TransferBalanceScreen extends StatelessWidget {
  const TransferBalanceScreen({
    super.key,
    required this.senderBalance,
    required this.receiverInfo,
  });

  final List<BalanceEntity> senderBalance;
  final UserInfoEntity receiverInfo;

  static const String routeName = "transfer-balance";
  static const String routePath = "/$routeName";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdaptiveBackAppbar(
        title: Text(
          R.strings.lblTransfer,
          style: context.textTheme.titleLarge,
        ),
        actions: [
          TextButton(
            onPressed: context.goHistory,
            child: Text(R.strings.lblHistory),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: $styles.grid.columnsMargin,
          right: $styles.grid.columnsMargin,
          top: $styles.grid.columnsMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(title: 'To'),
            Text(receiverInfo.name),
            Text('(${receiverInfo.email})'),
          ],
        ),
      ),
    );
  }
}
