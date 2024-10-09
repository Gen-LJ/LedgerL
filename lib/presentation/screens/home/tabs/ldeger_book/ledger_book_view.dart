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
          LedgerReady() => LedgerReadyView(
              allBalance: state.allBalance,
            ),
          _ => const Center(child: CircularProgressIndicator())
        };
      },
    );
  }
}


