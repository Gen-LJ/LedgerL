import 'package:flutter/material.dart';
import 'package:ledger_l/domain/domain.dart';
import 'package:ledger_l/presentation/presentation.dart';

class TransferSuccessScreen extends StatelessWidget {
  final TransactionEntity transactionData;

  const TransferSuccessScreen({super.key, required this.transactionData});

  static const String routeName = "transfer-success";
  static const String routePath = "/$routeName";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: $styles.grid.columnsMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SectionTitle(title: 'Transfer Success'),
              ($styles.insets.sm/2).toHeightSizedBox,
              RichText(
                text: TextSpan(
                  children: [
                    // const TextSpan(text: 'Successfully Transfer '),
                    TextSpan(
                      text: '${transactionData.amount}', // Highlighted amount
                      style: context.textTheme.titleMedium
                          ?.copyWith(color: context.theme.primaryColor),
                    ),
                    TextSpan(
                        text: ' (${transactionData.currencyType}) to ',
                        style: context.textTheme.bodyMedium),
                    TextSpan(
                      text: transactionData.receiverEmail,
                      // Highlighted email
                      style: context.textTheme.titleMedium
                          ?.copyWith(color: $styles.color.clrGreen),
                    ),
                  ],
                ),
              ),
              $styles.insets.sm.toHeightSizedBox,
              CustomElevatedButton(
                  onPressed: context.goIndex, child: const Text('Continue'))
            ],
          ),
        ),
      ),
    );
  }
}
