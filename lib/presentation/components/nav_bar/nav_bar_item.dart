import 'package:flutter/material.dart';

import '../../presentation.dart';

class NavBarItem extends StatelessWidget {
  final bool isSelected;
  final NavItem navItem;

  const NavBarItem({
    super.key,
    required this.navItem,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? navItem.selectedColor : navItem.color;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          isSelected ? navItem.selectedIcon : navItem.icon,
        ),

        // SvgIcon(
        //   isSelected ? navItem.selectedIcon : navItem.icon,
        //   color: color,
        // ),
        SizedBox(height: $styles.insets.xxs),
          Text(
            navItem.label,
            style: context.textTheme.bodySmall?.copyWith(
              color: color,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500
            ),
          )
      ],
    );
  }
}
