import 'package:flutter/material.dart';
import '../../presentation.dart';

class Chevron extends StatelessWidget {
  final double size;
  final Color? color;
  const Chevron({super.key, required this.size, this.color});

  factory Chevron.sm({Color? color}) {
    return Chevron(
      size: $styles.size.size200,
      color: color,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: SvgIcon(
        R.icons.chevronRight,
        color: color,
      ),
    );
  }
}
