import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ledger_l/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initial data load
    context.read<TransactionHistoryCubit>().loadData();

    return BlocBuilder<TransactionHistoryCubit, TransactionHistoryState>(
      builder: (context, state) {
        return switch (state) {
          THistoryReady() => ListView.separated(
              controller: context
                  .read<TransactionHistoryCubit>()
                  .historyScrollController,
              padding: EdgeInsets.symmetric(
                  horizontal: $styles.grid.columnsMargin),
              itemBuilder: (context, index) {
                if (index == state.transactions.length) {
                  // Show loading indicator at the bottom when fetching more
                  return const Center(child: CircularProgressIndicator());
                }
                return Container(
                  height: $styles.insets.lg * 2,
                  child: Row(
                    children: [
                      Text('Received'),
                      Text(state.transactions[index].amount.toString())
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return $styles.insets.sm.toHeightSizedBox;
              },
              itemCount: state.transactions.length + 1 // Add one for loading indicator
          ),
          _ => const CustomCircularIndicator(),
        };
      },
    );
  }
}

// class HistoryScreen extends StatelessWidget {
//   const HistoryScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     context.read<TransactionHistoryCubit>().loadData();
//     return BlocBuilder<TransactionHistoryCubit, TransactionHistoryState>(
//       builder: (context, state) {
//         return switch (state) {
//           THistoryReady() => ListView.separated(
//               controller: context
//                   .read<TransactionHistoryCubit>()
//                   .historyScrollController,
//               padding:
//                   EdgeInsets.symmetric(horizontal: $styles.grid.columnsMargin),
//               itemBuilder: (context, index) {
//                 return Container(
//                   child: Row(
//                     children: [
//                       Text('Received'),
//                       Text(state.transactions[index].amount.toString())
//                     ],
//                   ),
//                 );
//               },
//               separatorBuilder: (context, index) {
//                 return $styles.insets.xs.toHeightSizedBox;
//               },
//               itemCount: state.transactions.length),
//           _ => const CustomCircularIndicator(),
//         };
//       },
//     );
//   }
// }
