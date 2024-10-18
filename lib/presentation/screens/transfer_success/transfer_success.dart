import 'package:flutter/material.dart';
import 'package:ledger_l/domain/domain.dart';
import 'package:ledger_l/presentation/presentation.dart';

class TransferSuccessScreen extends StatelessWidget {
  final TransactionEntity transactionData;

  const TransferSuccessScreen({super.key, required this.transactionData});

  static const String routeName = "transfer-success";
  static const String routePath = "/$routeName";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: kToolbarHeight),
        child: TransactionSuccessBody(
          isSender: true,
          isDetails: false,
          transactionDetails: transactionData,
        ),
      ),
    );
  }
}
