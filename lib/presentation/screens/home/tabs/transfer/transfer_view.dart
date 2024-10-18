import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ledger_l/presentation/presentation.dart';

class TransferView extends StatelessWidget {
  const TransferView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: $styles.grid.columnsMargin,
        right: $styles.grid.columnsMargin,
        top: $styles.grid.columnsMargin,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TransferCard(),
          $styles.grid.columnsMargin.toHeightSizedBox,
           SectionTitle(title: R.strings.lblAllUsers),
          $styles.insets.xs.toHeightSizedBox,
          Expanded(
            child: BlocBuilder<TransferViewCubit, TransferViewState>(
              builder: (context, state) {
                return switch (state) {
                  TransferViewReady() => TransferReadyView(
                      walletUsers: state.walletUsers,
                    ),
                  _ => const TransferLoadingView(),
                };
              },
            ),
          ),
        ],
      ),
    );
  }
}
