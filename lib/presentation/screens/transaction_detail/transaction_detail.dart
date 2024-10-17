import 'package:flutter/material.dart';
import 'package:ledger_l/domain/domain.dart';

import '../../presentation.dart';

class TransactionDetailScreen extends StatelessWidget {
  const TransactionDetailScreen(
      {super.key, required this.transactionDetails, required this.isSender});

  final TransactionEntity transactionDetails;
  final bool isSender;

  static const String routeName = "transaction-details";
  static const String routePath = "/$routeName";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdaptiveBackAppbar(
        title: Text(
          R.strings.lblTransactionDetails,
          style: context.textTheme.titleLarge,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: $styles.grid.columnsMargin,
          right: $styles.grid.columnsMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            $styles.insets.sm.toHeightSizedBox,
            Column(
              children: [
                Container(
                  width: $styles.insets.xl,
                  height: $styles.insets.xl,
                  decoration: BoxDecoration(
                    color: context.theme.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all($styles.insets.xxs / 2),
                  child: Icon(
                    Icons.check,
                    color: context.theme.colorScheme.onPrimary,
                    size: $styles.insets.md * 1.5,
                  ),
                ),
                $styles.insets.sm.toHeightSizedBox,
                Text(
                  'Transaction Successful',
                  style: context.textTheme.labelSmall?.copyWith(
                      fontWeight: context.textTheme.titleSmall?.fontWeight),
                ),
                $styles.insets.xxs.toHeightSizedBox,
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: isSender
                        ? '-${transactionDetails.amount}'
                        : '+${transactionDetails.amount}',
                    style: context.textTheme.headlineMedium?.copyWith(
                      color: isSender
                          ? $styles.color.clrRed
                          : $styles.color.clrGreen,
                    ),
                  ),
                  TextSpan(
                    text: ' (${transactionDetails.currencyType})',
                    style: context.textTheme.titleLarge?.copyWith(color: context.theme.primaryColor),
                  )
                ]))
              ],
            ),
            $styles.insets.sm.toHeightSizedBox,
            const CustomDivider(),
            $styles.insets.sm.toHeightSizedBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Transaction ID'),
                Flexible(child: Text(transactionDetails.transactionId))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Transaction Time'),
                Flexible(child: Text(transactionDetails.createdAt.toString()))
              ],
            ),
            const CustomDivider(),
            isSender
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Transfer To'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Email'),
                          Flexible(
                              child: Text(transactionDetails.receiverEmail))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('ID'),
                          Flexible(child: Text(transactionDetails.receiverId))
                        ],
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Transfer From'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Email'),
                          Flexible(child: Text(transactionDetails.senderEmail))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('ID'),
                          Flexible(child: Text(transactionDetails.senderId))
                        ],
                      ),
                    ],
                  ),
            const CustomDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Currency'),
                Flexible(child: Text(transactionDetails.currencyType))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Amount'),
                Flexible(child: Text(transactionDetails.amount.toString()))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
