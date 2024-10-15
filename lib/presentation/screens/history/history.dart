import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ledger_l/presentation/presentation.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Load the initial data when the screen is displayed
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

              // Check if the current index is the last index and if loading more items
              if (index == state.transactions.length) {
                if (cubit.isLoadingMore) {
                  // Show loading indicator at the end
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

              // Otherwise, render the transaction item
              final transaction = state.transactions[index];
              return ListTile(
                title: Text('Transaction ${transaction.amount}'),
                subtitle: Text('Date: ${transaction.createdAt}'),
              );
            },
            separatorBuilder: (context, index) => const Divider(),
            // Add 1 to itemCount to account for the loading indicator
            itemCount: state.transactions.length + (context.read<TransactionHistoryCubit>().isLoadingMore ? 1 : 0),
          ),
          _ => const Center(child: CircularProgressIndicator()), // Show global loading while fetching initial data
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
