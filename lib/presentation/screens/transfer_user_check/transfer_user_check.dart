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
            child:  Text(R.strings.lblHistory),
          )
        ],
      ),
    );
  }
}
