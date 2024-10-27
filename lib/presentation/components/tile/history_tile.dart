import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ledger_l/presentation/extensions/date_time.dart';
import 'package:ledger_l/presentation/presentation.dart';

class HistoryTile extends StatelessWidget {
  const HistoryTile({
    super.key,
    required this.isSender,
    required this.receiverName,
    required this.senderName,
    required this.onPressed,
    required this.currencyType,
    required this.amount, required this.time,
  });

  final String currencyType;
  final String amount;
  final bool isSender;
  final String receiverName;
  final String senderName;
  final DateTime time;
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
              SvgIcon(
                currencyType.symbol,
                size: 18,
              ),

              $styles.insets.sm.toWidthSizedBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isSender ? R.strings.lblTo : R.strings.lblFrom,),
                  Text(
                    isSender ? receiverName : senderName,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(time.toAMPMFormat(),style: context.textTheme.labelSmall?.copyWith(color: context.textTheme.bodySmall?.color),)
                ],
              ),
            ],
          ),
          $styles.insets.xs.toWidthSizedBox,
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
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
              SvgPicture.asset(currencyType.flag,fit: BoxFit.fitHeight,height: $styles.size.size100 * 2,)
            ],
          ),
        ],
      ),
    );
  }
}