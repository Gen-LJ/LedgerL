import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ledger_l/presentation/presentation.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<TransactionHistoryCubit>()..loadData();
    return BlocBuilder<TransactionHistoryCubit, TransactionHistoryState>(
      builder: (context, state) {
        return switch (state) {
          THistoryReady() => ListView.separated(
              controller: bloc.scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemBuilder: (context, index) {
                if (index == state.transactions.length) {
                  if (state.loadingMore) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: CustomCircularIndicator(),
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                }
                final transaction = state.transactions[index];
                return ListTile(
                  title: Text('Transaction ${transaction.amount}'),
                  subtitle: Text('Date: ${transaction.createdAt}'),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount:
                  state.transactions.length + (state.loadingMore ? 1 : 0),
            ),
          THistoryError() => Center(
              child: Text(state.message),
            ),
          _ => const Center(child: CustomCircularIndicator()),
        };
      },
    );
  }
}
