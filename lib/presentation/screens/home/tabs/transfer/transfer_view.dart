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
          TransferReady() => TransferReadyView(
              walletUsers: state.walletUsers,
            ),
          _ => const Center(child: CustomCircularIndicator())
        };
      },
    );
  }
}


