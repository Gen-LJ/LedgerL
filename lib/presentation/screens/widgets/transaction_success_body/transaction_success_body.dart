import 'package:flutter/material.dart';
import 'package:ledger_l/domain/domain.dart';
import '../../../presentation.dart';

class TransactionSuccessBody extends StatelessWidget {
  const TransactionSuccessBody({
    super.key,
    required this.isSender,
    required this.transactionDetails,
    this.isDetails = true,
  });

  final bool isSender;
  final bool isDetails;
  final TransactionEntity transactionDetails;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        left: $styles.grid.columnsMargin,
        right: $styles.grid.columnsMargin,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          $styles.insets.sm.toHeightSizedBox,
          SuccessMarker(
            isSender: isSender,
            transactionDetails: transactionDetails,
          ),
          $styles.insets.sm.toHeightSizedBox,
          const CustomDivider(),
          $styles.insets.sm.toHeightSizedBox,
          DetailsSection(
            transactionDetails: transactionDetails,
            isSender: isSender,
          ),
          ($styles.grid.columnsMargin * 2).toHeightSizedBox,
          !isDetails
              ? CustomElevatedButton(
                  onPressed: context.goIndex,
                  child: Text(R.strings.lblContinue))
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
