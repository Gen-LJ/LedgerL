import 'package:flutter/material.dart';
import '../../presentation.dart';

class TransferUserCheckScreen extends StatelessWidget {
  const TransferUserCheckScreen({super.key});

  static const String routeName = "transfer-user-check";
  static const String routePath = "/$routeName";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdaptiveBackAppbar(
        title: Text(
          R.strings.lblTransfer,
          style: context.textTheme.titleLarge,
        ),
        actions: [
          TextButton(
            onPressed: context.goHistory,
            child: Text(R.strings.lblHistory),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: $styles.grid.columnsMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReceiverDataCheckContainer(
              onValidated: (value){
              debugPrint('Validation Success');
              debugPrint('Working on Transfer function');
            },),
            $styles.grid.columnsMargin.toHeightSizedBox,
            Text(
              'Related Users',
              style: context.textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}


