import 'package:flutter/material.dart';

import '../../../presentation.dart';

class LoginElevatedButton extends StatelessWidget {
  const LoginElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.imagePath,
  });

  final String text;
  final VoidCallback onPressed;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular($styles.corner.lg)),
          elevation: 2,
          shadowColor: Colors.black.withOpacity(1),
        ),
        onPressed: onPressed,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: $styles.insets.sm,
            // horizontal: $styles.insets.xs,
          ),
          child: Stack(
              alignment: Alignment.center,
              children:[
                imagePath != null
                    ? Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    imagePath!,
                    height: $styles.size.size500,
                  ),
                )
                    : const SizedBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // SizedBox(
                    //   width: $styles.insets.xs,
                    // ),
                    Text(
                      text,
                      style: context.textTheme.titleSmall?.medium,
                    ),
                  ],
                ),]
          ),
        ));
  }
}