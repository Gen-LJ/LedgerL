import 'package:flutter/material.dart';
import 'package:ledger_l/presentation/presentation.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(R.strings.lblHistory)
        ],
      ),
    );
  }
}
