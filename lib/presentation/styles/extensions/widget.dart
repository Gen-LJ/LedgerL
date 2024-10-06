import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

extension ShimmerUtils on Widget {
  Widget shim(BuildContext context) {
    final theme = Theme.of(context);
    return animate(onPlay: (controller) => controller.repeat()).shimmer(
      padding: 0,
      duration: 5000.ms,
      size: 4.0,
      color: theme.textTheme.bodyMedium!.color!.withOpacity(0.1),
      colors: [
        theme.textTheme.bodyMedium!.color!.withOpacity(0.05),
        theme.textTheme.bodyMedium!.color!.withOpacity(0.1),
        theme.textTheme.bodyMedium!.color!.withOpacity(0.05),
      ],
    );
  }
}
