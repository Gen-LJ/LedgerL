import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ledger_l/domain/domain.dart';
import '../../../../../presentation.dart';

class LedgerReadyView extends StatelessWidget {
  final List<BalanceEntity> allBalance;

  const LedgerReadyView({
    super.key,
    required this.allBalance,
    required this.onRefresh,
  });

  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: BlocSelector<LedgerCubit, LedgerState, bool>(
        selector: (state) {
          return switch (state) {
            LedgerReady() => state.refresh,
            _ => false,
          };
        },
        builder: (context, loading) {
          return LoadingOverlay(
            opacity: 0,
            isLoading: loading,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                $styles.grid.columnsMargin.toHeightSizedBox,
                Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: $styles.grid.columnsMargin),
                  child: const SectionTitle(title: 'Balance'),
                ),
                $styles.insets.sm.toHeightSizedBox,
                Expanded(
                  child: ListView.separated(
                    padding:
                    EdgeInsets.symmetric(
                        horizontal: $styles.grid.columnsMargin),
                    separatorBuilder: (context, index) {
                      return $styles.insets.xs.toHeightSizedBox;
                    },
                    itemCount: allBalance.length,
                    itemBuilder: (_, index) {
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
                              Text(
                                allBalance[index].currency,
                                style: context.textTheme.titleMedium,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                allBalance[index].amount.toString(),
                                style: context.textTheme.titleMedium,
                              ),
                              $styles.insets.xs.toWidthSizedBox,
                              SvgIcon(
                                  size: 14, allBalance[index].currency.symbol),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
