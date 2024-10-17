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
          THistoryReady() => HistoryReadyView(
              bloc: context.read<TransactionHistoryCubit>(),
              transactions: state.transactions,
              loadingMore: state.loadingMore,
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
