import 'package:flutter/material.dart';
import 'package:ledger_l/presentation/presentation.dart';

class HistoryTile extends StatelessWidget {
  const HistoryTile({
    super.key,
    required this.isSender,
    required this.receiverName,
    required this.senderName,
    required this.onPressed,
    required this.currencyType,
    required this.amount,
  });

  final String currencyType;
  final String amount;
  final bool isSender;
  final String receiverName;
  final String senderName;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isSender ? R.strings.lblTo : R.strings.lblFrom,
                    style: context.textTheme.titleMedium
                        ?.copyWith(color: context.textTheme.titleMedium?.color),
                  ),
                  Text(
                    isSender ? receiverName : senderName,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
          $styles.insets.xs.toWidthSizedBox,
          Row(
            children: [
              Text(
                isSender ? '- $amount' : '+ $amount',
                style: context.textTheme.titleMedium?.copyWith(
                  color:
                  isSender ? $styles.color.clrRed : $styles.color.clrGreen,
                ),
              ),
              $styles.insets.xxs.toWidthSizedBox,
              Text(
                '($currencyType)',
                style: context.textTheme.titleSmall
              ),
            ],
          ),
        ],
      ),
    );
  }
}