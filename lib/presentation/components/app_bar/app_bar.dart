import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../presentation.dart';

class StyledAppBar extends AppBar {
  StyledAppBar._({
    super.title,
    super.leading,
    super.actions,
    super.flexibleSpace,
    super.elevation,
    super.titleSpacing,
    super.toolbarHeight,
  });

  factory StyledAppBar({
    Widget? leading,
    Widget? title,
    Widget? flexibleSpace,
    bool useGradient = true,
    List<Widget> actions = const [],
    double? elevation,
    double titleSpacing = 0,
    double? toolbarHeight,
    EdgeInsets? padding,
  }) {
    return StyledAppBar._(
      toolbarHeight: toolbarHeight,
      elevation: elevation,
      titleSpacing: titleSpacing,
      title: title ??
          Builder(builder: (context) {
            return Padding(
              padding: EdgeInsets.only(left: $styles.grid.columnsMargin),
              child: InkWell(
                onTap: () => context.go("/"),
                child: SvgPicture.asset(
                  R.images.appLogo,
                  height: $styles.size.size100 * 6,
                ),
              ),
            );
          }),
      leading: leading,
      flexibleSpace: flexibleSpace,
      actions: [
        ...actions,
        SizedBox(width: $styles.grid.columnsMargin - $styles.insets.xs),
      ],
    );
  }
}
