import 'package:flutter/material.dart';
import 'package:ledger_l/presentation/presentation.dart';


class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TabBar(
              dividerHeight: 0.1,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Padding(
                  padding: EdgeInsets.all($styles.insets.sm / 1.5),
                  child: const Text('Ledger Book'),
                ),
                Padding(
                  padding: EdgeInsets.all($styles.insets.sm / 1.5),
                  child: const Text('Transfer'),
                ),
              ]),
          const Expanded(
              child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                LedgerBookView(),
                TransferView(),
              ]))
        ],
      ),
    );
  }
}


