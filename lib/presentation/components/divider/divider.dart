import 'package:flutter/material.dart';

import '../../presentation.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: $styles.insets.sm,
      color: context.theme.cardColor,
      thickness: 2,
    );
  }
}