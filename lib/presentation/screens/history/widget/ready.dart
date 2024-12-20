import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ledger_l/domain/domain.dart';
import 'package:ledger_l/presentation/presentation.dart';

class HistoryReadyView extends StatelessWidget {
  const HistoryReadyView({
    super.key,
    required this.bloc,
    required this.transactions,
    required this.loadingMore, required this.onRefresh,
  });

  final TransactionHistoryCubit bloc;
  final List<TransactionEntity> transactions;
  final bool loadingMore;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.separated(
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
            receiverName: transaction.receiverName,
            senderName: transaction.senderName,
            isSender: userID == transaction.senderId,
            time: transaction.createdAt,
          );
        },
        separatorBuilder: (context, index) => const CustomDivider(),
      ),
    );
  }
}


