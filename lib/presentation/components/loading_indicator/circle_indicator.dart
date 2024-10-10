import 'package:flutter/material.dart';
import 'package:ledger_l/presentation/presentation.dart';


class CustomCircularIndicator extends StatelessWidget {
  const CustomCircularIndicator({
    super.key, this.color,
  });

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width : $styles.insets.md,
        height : $styles.insets.md,
        child: CircularProgressIndicator.adaptive(
          valueColor: AlwaysStoppedAnimation<Color>(
            color ?? context.theme.primaryColor,
          ),
        ));
  }
}