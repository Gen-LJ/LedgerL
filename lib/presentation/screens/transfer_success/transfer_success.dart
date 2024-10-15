import 'package:flutter/material.dart';
import 'package:ledger_l/presentation/presentation.dart';

class TransferSuccessScreen extends StatelessWidget {
  const TransferSuccessScreen({super.key});

  static const String routeName = "transfer-success";
  static const String routePath = "/$routeName";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('Transfer Success'),
            $styles.insets.sm.toHeightSizedBox,
            CustomElevatedButton(
                onPressed: context.goIndex,
                child: const Text('Continue'))
          ],
        ),
      ),
    );
  }
}
