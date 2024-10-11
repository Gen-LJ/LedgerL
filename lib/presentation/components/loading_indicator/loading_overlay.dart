import 'package:flutter/material.dart';
import 'package:ledger_l/presentation/presentation.dart';

class LoadingOverlay extends StatelessWidget {
  final bool isLoading;
  final String? loadingInfo;
  final Widget? child;

  const LoadingOverlay({
    super.key,
    this.isLoading = false,
    this.child,
    this.loadingInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          child ??
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    width: context.width,
                  ),
                ],
              ),
          if (isLoading)
            Positioned.fill(
              child: ColoredBox(
                color: Colors.black.withOpacity(0.3),
                child: Center(
                  child: Card(
                    elevation: 0,
                    color: context.theme.cardColor,
                    child: Padding(
                      padding:  EdgeInsets.all($styles.insets.sm),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomCircularIndicator(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          loadingInfo != null
                              ? Column(
                                  children: [
                                    $styles.insets.xs.toHeightSizedBox,
                                    Text(loadingInfo!),
                                  ],
                                )
                              : const SizedBox.shrink()
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
