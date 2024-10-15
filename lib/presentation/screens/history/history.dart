import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ledger_l/presentation/presentation.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<TransactionHistoryCubit>().loadData();

    return BlocBuilder<TransactionHistoryCubit, TransactionHistoryState>(
      builder: (context, state) {
        return switch (state) {
          THistoryReady() => ListView.separated(
              controller: context
                  .read<TransactionHistoryCubit>()
                  .historyScrollController,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemBuilder: (context, index) {
                final cubit = context.read<TransactionHistoryCubit>();

                if (index == state.transactions.length) {
                  if (cubit.isLoadingMore) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    return const SizedBox(); // Return empty widget if not loading
                  }
                }

                final transaction = state.transactions[index];
                return ListTile(
                  title: Text('Transaction ${transaction.amount}'),
                  subtitle: Text('Date: ${transaction.createdAt}'),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: state.transactions.length +
                  (context.read<TransactionHistoryCubit>().isLoadingMore
                      ? 1
                      : 0),
            ),
          THistoryError() => Center(
              child: Text(state.message),
            ),
          _ => const Center(
              child:
                  CustomCircularIndicator()), // Show global loading while fetching initial data
        };
      },
    );
  }
}
