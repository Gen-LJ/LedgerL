import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ledger_l/presentation/presentation.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final bool? cancelButton;
  final double? width;

  const CustomElevatedButton(
      {super.key,
      this.onPressed,
      required this.child,
      this.cancelButton,
      this.width});

  @override
  Widget build(BuildContext context) {
    final isDark = context.read<AppSettingCubit>().isDark;

    return SizedBox(
      width: width ?? double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: cancelButton == true
                ? isDark ? context.theme.cardColor :context.theme.colorScheme.onPrimary
                : null,
            foregroundColor: cancelButton == true
                ?  context.theme.colorScheme.primary
                : null,
            shape: cancelButton == true ? RoundedRectangleBorder(
              side: BorderSide(
                color: isDark ?  context.theme.colorScheme.secondary : context.theme.colorScheme.primary
              ),
              borderRadius: BorderRadius.circular($styles.insets.xs,
              ), // Rounded corners
            ) : null,
          ),
          onPressed: onPressed,
          child: Padding(
            padding: width != null
                ? EdgeInsets.zero
                : EdgeInsets.all($styles.insets.xs),
            child: child,
          )),
    );
  }
}
