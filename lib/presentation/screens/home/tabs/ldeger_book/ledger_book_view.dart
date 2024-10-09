import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ledger_l/presentation/presentation.dart';

class LedgerBookView extends StatelessWidget {
  const LedgerBookView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LedgerCubit, LedgerState>(
      builder: (context, state) {
        return switch (state) {
          LedgerReady() => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              $styles.grid.columnsMargin.toHeightSizedBox,
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: $styles.grid.columnsMargin),
                child: const Text('Balance'),
              ),
              $styles.insets.sm.toHeightSizedBox,
              Expanded(
                  child: ListView.separated(
                      padding: EdgeInsets.symmetric(
                          horizontal: $styles.grid.columnsMargin),
                      separatorBuilder: (context, index) {
                        return $styles.insets.xs.toHeightSizedBox;
                      },
                      itemCount: state.allBalance.length,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(state.allBalance[index].currency),
                            Text(state.allBalance[index].amount.toString()),
                          ],
                        );
                      }))
            ],
          ),
          _ => const Center(child: CircularProgressIndicator())
        };
      },
    );
  }
}