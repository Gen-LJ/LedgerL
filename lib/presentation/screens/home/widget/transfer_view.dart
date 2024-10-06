import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ledger_l/presentation/presentation.dart';

class TransferView extends StatelessWidget {
  const TransferView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransferCubit, TransferState>(
      builder: (context, state) {
        return switch (state) {
          TransferReady() => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              $styles.grid.columnsMargin.toHeightSizedBox,
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: $styles.grid.columnsMargin),
                child: const Text('Users'),
              ),
              $styles.insets.sm.toHeightSizedBox,
              Expanded(
                  child: ListView.separated(
                      padding: EdgeInsets.symmetric(
                          horizontal: $styles.grid.columnsMargin),
                      separatorBuilder: (context, index) {
                        return $styles.insets.xs.toHeightSizedBox;
                      },
                      itemCount: state.walletUsers.length,
                      itemBuilder: (context, index) {
                        return Text(state.walletUsers[index].email);
                      }))
            ],
          ),
          _ => const Center(child: CircularProgressIndicator())
        };
      },
    );
  }
}