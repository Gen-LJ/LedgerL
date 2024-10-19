import 'package:flutter/material.dart';

import '../../../../../presentation.dart';

class TransferCard extends StatelessWidget {
  const TransferCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
        onPressed: context.pushTransferUserCheck,
        child: Column(
          children: [
            const Icon(Icons.currency_exchange),
            $styles.insets.xs.toHeightSizedBox,
             Text(R.strings.lblTransfer),
          ],
        ));
  }
}