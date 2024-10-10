import 'dart:io';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:ledger_l/core/core.dart';
import 'package:ledger_l/presentation/presentation.dart';

class AdaptiveBackAppbar extends AppBar {
  AdaptiveBackAppbar._({
    super.title,
    super.leading,
    super.actions,
    super.flexibleSpace,
    super.elevation,
    super.titleSpacing,
    super.toolbarHeight,
  });

  factory AdaptiveBackAppbar({
    Widget? title,
    Widget? flexibleSpace,
    bool useGradient = true,
    List<Widget> actions = const [],
    double? elevation,
    double titleSpacing = 0,
    double? toolbarHeight,
    EdgeInsets? padding,
  }) {
    final navigationService = inject<INavigationKeyProvider>();
    return AdaptiveBackAppbar._(
      toolbarHeight: toolbarHeight,
      elevation: elevation,
      titleSpacing: titleSpacing,
      title: title,
      leading: Platform.isAndroid || Platform.isIOS
          ? IconButton(
              onPressed: navigationService.globalKey.context?.pop,
              icon: Icon(Platform.isAndroid
                  ? Icons.arrow_back
                  : Icons.arrow_back_ios_new),
            )
          : null,
      flexibleSpace: flexibleSpace,
      actions: [
        ...actions,
        SizedBox(width: $styles.grid.columnsMargin - $styles.insets.xs),
      ],
    );
  }
}
