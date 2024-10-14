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
      backgroundColor: context.theme.cardColor,
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
        child: Container(
          color: context.theme.scaffoldBackgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReceiverProfile(receiverInfo: receiverInfo),
              $styles.grid.columnsMargin.toHeightSizedBox,
              TransactionContainer(senderBalance: senderBalance,receiverInfo: receiverInfo,)
            ],
          ),
        ),
      ),
    );
  }
}
