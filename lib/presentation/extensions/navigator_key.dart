import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

extension NavigatorKeyX on GlobalKey<NavigatorState> {
  BuildContext? get context => currentState?.context;
}