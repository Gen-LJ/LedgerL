import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ledger_l/presentation/presentation.dart';
import '../../../../domain/domain.dart';

class TransactionContainer extends StatelessWidget {
  const TransactionContainer({
    super.key,
    required this.senderBalance,
  });

  final List<BalanceEntity> senderBalance;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          top: $styles.grid.columnsMargin / 1.6,
          bottom: 10),
      child: BlocBuilder<TransferBalanceCubit, TransferBalanceState>(
        builder: (context, state) {
          final bloc = context.read<TransferBalanceCubit>();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionTitle(title: R.strings.lblCurrency),
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
                            color:
                                isSelected ? context.theme.primaryColor : null,
                            borderRadius:
                                BorderRadius.circular($styles.insets.xxs)),
                        padding: EdgeInsets.all($styles.insets.xs),
                        child: Text(
                          senderBalance[index].currency,
                          style: context.textTheme.bodyMedium?.copyWith(
                              color: isSelected
                                  ? context.theme.colorScheme.onPrimary
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
                    borderRadius: BorderRadius.circular($styles.insets.xxs)),
                padding: EdgeInsets.all($styles.insets.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'Amount (${senderBalance[bloc.currentIndex].currency})'),
                    $styles.insets.xxs.toHeightSizedBox,
                    TextFormField(
                      style:
                          context.textTheme.bodyLarge?.copyWith(fontSize: 30),
                      controller: bloc.textEditingController,
                      focusNode: bloc.focusNode,
                      onFieldSubmitted: (value) {},
                      keyboardType: const TextInputType.numberWithOptions(),
                    ),
                    $styles.insets.sm.toHeightSizedBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Available Balance(${state.currency?.currency ?? senderBalance.first.currency}) - '
                          '${!state.onHide ? senderBalance[bloc.currentIndex].amount : '*****'}',
                          style: context.textTheme.labelSmall?.copyWith(
                              color: context.textTheme.labelSmall?.color
                                  ?.withOpacity(0.5)),
                        ),
                        InkWell(
                            onTap: bloc.onHideAvailableBalance,
                            child: Icon(!bloc.hideAvailable
                                ? Icons.key_off_outlined
                                : Icons.key_outlined))
                      ],
                    ),
                  ],
                ),
              ),
              $styles.insets.sm.toHeightSizedBox,
              CustomElevatedButton(
                  onPressed: () {}, child: Text(R.strings.lblTransfer))
            ],
          );
        },
      ),
    );
  }
}
