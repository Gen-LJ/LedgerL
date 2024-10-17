import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ledger_l/domain/domain.dart';
import 'package:ledger_l/presentation/presentation.dart';

class HistoryReadyView extends StatelessWidget {
  const HistoryReadyView({
    super.key,
    required this.bloc,
    required this.transactions,
    required this.loadingMore,
  });

  final TransactionHistoryCubit bloc;
  final List<TransactionEntity> transactions;
  final bool loadingMore;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: transactions.length + (loadingMore ? 1 : 0),
      controller: bloc.scrollController,
      padding: EdgeInsets.symmetric(horizontal: $styles.grid.columnsMargin),
      itemBuilder: (context, index) {
        if (index >= transactions.length) {
          return loadingMore
              ? Center(
                  child: Padding(
                    padding: EdgeInsets.all($styles.insets.sm),
                    child: const CustomCircularIndicator(),
                  ),
                )
              : const SizedBox.shrink();
        }
        final userID = context.read<AuthenticationCubit>().userId;
        final transaction = transactions[index];
        final receiverEmail = transaction.receiverEmail;
        final senderEmail = transaction.senderEmail;
        final senderID = transaction.senderId;
        bool isSender = userID == senderID;
        return InkWell(
          onTap: () {
            debugPrint('Tapping Index $index');
          },
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
                        style: context.textTheme.titleMedium?.copyWith(
                            color: context.textTheme.titleMedium?.color),
                      ),
                      Text(
                        isSender ? receiverEmail : senderEmail,
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
                    isSender
                        ? '- ${transaction.amount.toString()}'
                        : '+ ${transaction.amount.toString()}',
                    style: context.textTheme.titleMedium?.copyWith(
                      color: isSender
                          ? $styles.color.clrRed
                          : $styles.color.clrGreen,
                    ),
                  ),
                  $styles.insets.xxs.toWidthSizedBox,
                  Text(
                    '(${transaction.currencyType})',
                    style: context.textTheme.titleSmall
                        ?.copyWith(color: context.theme.primaryColor),
                  ),
                ],
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => Divider(
        height: $styles.insets.sm,
        color: context.theme.cardColor,
        thickness: 2,
      ),
    );
  }
}
