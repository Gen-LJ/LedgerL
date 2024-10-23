import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ledger_l/domain/domain.dart';
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
                      Column(
                        children: [
                         index == 0 ?  SvgPicture.asset(
                            R.flags.singapore,
                          ): index == 1 ? SvgPicture.asset(
                           fit: BoxFit.fill,
                           R.flags.usa,
                         ) : SvgPicture.asset(
                           R.flags.europe,
                         ),
                          Text(allBalance[index].currency),
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
