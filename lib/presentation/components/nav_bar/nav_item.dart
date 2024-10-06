import 'package:flutter/material.dart';

class NavItem {
  final String label;
  final IconData icon;
  final IconData selectedIcon;
  final Color color;
  final Color selectedColor;

  const NavItem({
    required this.icon,
    required this.color,
    required this.selectedIcon,
    required this.selectedColor,
    required this.label,
  });
}
