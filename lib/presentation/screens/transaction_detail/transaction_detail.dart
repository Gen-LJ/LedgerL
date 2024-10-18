import 'package:flutter/material.dart';
import 'package:ledger_l/domain/domain.dart';
import '../../presentation.dart';

class TransactionDetailScreen extends StatelessWidget {
  const TransactionDetailScreen(
      {super.key, required this.transactionDetails, required this.isSender});

  final TransactionEntity transactionDetails;
  final bool isSender;

  static const String routeName = "transaction-details";
  static const String routePath = "/$routeName";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdaptiveBackAppbar(
        title: Text(
          R.strings.lblTransactionDetails,
          style: context.textTheme.titleLarge,
        ),
      ),
      body: TransactionSuccessBody(isSender: isSender, transactionDetails: transactionDetails),
    );
  }
}






