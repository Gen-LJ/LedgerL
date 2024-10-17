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
      padding: EdgeInsets.only(
          left: $styles.grid.columnsMargin,
          right: $styles.grid.columnsMargin,
          bottom: $styles.insets.sm),
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
        return HistoryTile(
          onPressed: () {
            context.pushTransactionDetails(
              transactionDetails: transaction,
              isSender: userID == transaction.senderId,
            );
          },
          currencyType: transaction.currencyType,
          amount: transaction.amount.toString(),
          receiverEmail: transaction.receiverEmail,
          senderEmail: transaction.senderEmail,
          isSender: userID == transaction.senderId,
        );
      },
      separatorBuilder: (context, index) => const CustomDivider(),
    );
  }
}


