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
              Padding(
                padding: EdgeInsets.only(
                  left: $styles.grid.columnsMargin,
                  right: $styles.grid.columnsMargin,
                  top: $styles.grid.columnsMargin / 2,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SectionTitle(title: 'To'),
                    ProfileCardTile(
                      imageUrl: receiverInfo.profileImage ?? '',
                      name: receiverInfo.name,
                      email: receiverInfo.email,
                    ),
                    $styles.grid.columnsMargin.toHeightSizedBox,
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: context.theme.cardColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular($styles.insets.sm),
                      topLeft: Radius.circular($styles.insets.sm),
                    )),
                width: double.infinity,
                padding: EdgeInsets.only(
                  left: $styles.grid.columnsMargin,
                  right: $styles.grid.columnsMargin,
                  top: $styles.grid.columnsMargin / 2,
                  bottom: 10
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SectionTitle(title: 'Currency'),
                    Text('Hi'),
                    Text('Hi'),
                    Text('Hi'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
