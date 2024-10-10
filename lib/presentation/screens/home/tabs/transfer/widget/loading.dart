import 'package:flutter/material.dart';
import '../../../../../presentation.dart';

class TransferLoadingView extends StatelessWidget {
  const TransferLoadingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // Centers vertically
        children: [
          Center(child: CustomCircularIndicator()),
          // Centers horizontally
        ],
      ),
    );
  }
}
