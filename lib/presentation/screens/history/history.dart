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
              padding: EdgeInsets.symmetric(
                  horizontal: $styles.grid.columnsMargin),
              itemBuilder: (context, index) {
                return Container(
                  child: Row(
                    children: [
                      Text('Received'),
                      Text(state.transactions[index].amount.toString())
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return $styles.insets.xs.toHeightSizedBox;
              },
              itemCount: state.transactions.length),
          _ => const CustomCircularIndicator(),
        };
      },
    );
  }
}
