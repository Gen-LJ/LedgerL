import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                    top: $styles.grid.columnsMargin /1.6,
                    bottom: 10),
                child: BlocBuilder<TransferBalanceCubit, TransferBalanceState>(
                  builder: (context, state) {
                    final bloc = context.read<TransferBalanceCubit>();
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SectionTitle(title: 'Currency'),
                        $styles.insets.sm.toHeightSizedBox,
                        Wrap(
                          spacing: $styles.insets.xxs,
                          children: [
                            ...List.generate(senderBalance.length, (index) {
                              bool isSelected = bloc.currentIndex == index;
                              return InkWell(
                                onTap: () {
                                  bloc.onTapCurrency(
                                    index: index,
                                    currency: senderBalance[index],
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: isSelected
                                          ? context.theme.primaryColor
                                          : null,
                                      borderRadius: BorderRadius.circular(
                                          $styles.insets.xxs)),
                                  padding: EdgeInsets.all($styles.insets.xs),
                                  child: Text(
                                    senderBalance[index].currency,
                                    style: context.textTheme.bodyMedium
                                        ?.copyWith(
                                            color: isSelected
                                                ? context
                                                    .theme.colorScheme.onPrimary
                                                : null),
                                  ),
                                ),
                              );
                            })
                          ],
                        ),
                        $styles.insets.sm.toHeightSizedBox,
                        Container(
                          decoration: BoxDecoration(
                              color: context.theme.colorScheme.primaryContainer
                                  .withOpacity(0.1),
                              borderRadius:
                                  BorderRadius.circular($styles.insets.xxs)),
                          padding: EdgeInsets.all($styles.insets.sm),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'Amount (${senderBalance[bloc.currentIndex].currency})'),
                              $styles.insets.xxs.toHeightSizedBox,
                              TextFormField(),
                              $styles.insets.sm.toHeightSizedBox,
                              Text(
                                'Available Balance(${state.currency?.currency ?? senderBalance.first.currency}) - ${senderBalance[bloc.currentIndex].amount}',
                                style: context.textTheme.labelSmall?.copyWith(
                                    color: context.textTheme.labelSmall?.color
                                        ?.withOpacity(0.5)),
                              ),
                            ],
                          ),
                        ),
                        $styles.insets.sm.toHeightSizedBox,
                        CustomElevatedButton(
                            onPressed: () {},
                            child: Text(R.strings.lblTransfer))
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
