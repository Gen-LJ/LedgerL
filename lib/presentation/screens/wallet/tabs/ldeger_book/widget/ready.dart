import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ledger_l/domain/domain.dart';
import 'package:ledger_l/presentation/extensions/flag.dart';
import '../../../../../presentation.dart';

class LedgerReadyView extends StatelessWidget {
  final List<BalanceEntity> allBalance;

  const LedgerReadyView({
    super.key,
    required this.allBalance,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        $styles.grid.columnsMargin.toHeightSizedBox,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: $styles.grid.columnsMargin),
          child: const SectionTitle(title: 'Balance'),
        ),
        $styles.insets.sm.toHeightSizedBox,
        Expanded(
            child: ListView.separated(
                padding: EdgeInsets.symmetric(
                    horizontal: $styles.grid.columnsMargin),
                separatorBuilder: (context, index) {
                  return $styles.insets.xs.toHeightSizedBox;
                },
                itemCount: allBalance.length,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            height: $styles.size.size700,
                            fit: BoxFit.fitHeight,
                            allBalance[index].currency.flag,
                          ),
                          $styles.insets.xs.toWidthSizedBox,
                          Text(allBalance[index].currency,style: context.textTheme.titleMedium,),
                        ],
                      ),
                      Text(allBalance[index].amount.toString()),
                    ],
                  );
                }))
      ],
    );
  }
}
