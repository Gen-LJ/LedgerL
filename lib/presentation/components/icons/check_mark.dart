import 'package:flutter/material.dart';

import '../../presentation.dart';

class CheckMark extends StatelessWidget {
  const CheckMark({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: $styles.insets.xl,
      height: $styles.insets.xl,
      decoration: BoxDecoration(
        color: context.theme.primaryColor,
        shape: BoxShape.circle,
      ),
      padding: EdgeInsets.all($styles.insets.xxs / 2),
      child: Icon(
        Icons.check,
        color: context.theme.colorScheme.onPrimary,
        size: $styles.insets.md * 1.5,
      ),
    );
  }
}