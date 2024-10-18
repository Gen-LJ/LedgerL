import 'package:flutter/material.dart';

import '../../../../domain/domain.dart';
import '../../../presentation.dart';

class SuccessMarker extends StatelessWidget {
  const SuccessMarker({
    super.key,
    required this.isSender,
    required this.transactionDetails,
  });

  final bool isSender;
  final TransactionEntity transactionDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CheckMark(),
        $styles.insets.sm.toHeightSizedBox,
        Text(
          R.strings.lblTransactionSuccess,
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
    );
  }
}

