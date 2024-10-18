import 'package:flutter/material.dart';
import 'package:ledger_l/domain/domain.dart';
import 'package:ledger_l/presentation/presentation.dart';

class DetailsSection extends StatelessWidget {
  const DetailsSection({
    super.key,
    required this.transactionDetails,
    required this.isSender,
  });

  final TransactionEntity transactionDetails;
  final bool isSender;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(R.strings.lblTransactionID),
            Flexible(child: Text(transactionDetails.transactionId))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(R.strings.lblTransactionTime),
            Flexible(child: Text(transactionDetails.createdAt.toString()))
          ],
        ),
        const CustomDivider(),
        isSender
            ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(R.strings.lblTransferTo),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Name'),
                Flexible(
                    child: Text(transactionDetails.receiverName))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(R.strings.lblEmail),
                Flexible(
                    child: Text(transactionDetails.receiverEmail.maskEmail()))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(R.strings.lblID),
                Flexible(child: Text(transactionDetails.receiverId.maskAndShowLastFour()))
              ],
            ),
          ],
        )
            : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(R.strings.lblTransferFrom),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Name'),
                Flexible(
                    child: Text(transactionDetails.senderName))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(R.strings.lblEmail),
                Flexible(child: Text(transactionDetails.senderEmail.maskEmail()))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(R.strings.lblID),
                Flexible(child: Text(transactionDetails.senderId.maskAndShowLastFour()))
              ],
            ),
          ],
        ),
        const CustomDivider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(R.strings.lblCurrency),
            Flexible(child: Text(transactionDetails.currencyType))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(R.strings.lblAmount),
            Flexible(child: Text(transactionDetails.amount.toString()))
          ],
        ),
      ],
    );
  }
}