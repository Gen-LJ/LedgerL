import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../presentation.dart';

class ConfirmCancelRowButton extends StatelessWidget {
  const ConfirmCancelRowButton({super.key, required this.onPressed, this.name, this.spacing});
  final VoidCallback onPressed;
  final String? name;
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: CustomElevatedButton(
            cancelButton: true,
            onPressed: context.pop,
            child:  const FittedBox(
                fit: BoxFit.scaleDown,
                child: Text('Cancel')),
          ),
        ),
        SizedBox(
          width: spacing ?? $styles.insets.sm,
        ),
        Expanded(
          child: CustomElevatedButton(
            onPressed: onPressed,
            child:  FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(name ?? 'Confirm')),
          ),
        ),
      ],
    );
  }
}
