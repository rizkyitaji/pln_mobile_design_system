import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

final navigatorKey = GlobalKey<NavigatorState>();

extension ContextExt on BuildContext {
  // ===== SCREEN =====
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get screenWidth => mediaQuery.size.width;
  double get screenHeight => mediaQuery.size.height;

  EdgeInsets get viewInsets => mediaQuery.viewInsets;
  EdgeInsets get viewPadding => mediaQuery.viewPadding;

  Orientation get orientation => mediaQuery.orientation;

  bool get isPortrait => orientation == Orientation.portrait;
  bool get isLandscape => orientation == Orientation.landscape;

  double get textScale => PlatformDispatcher.instance.textScaleFactor;

  AppTextTheme get textTheme => Theme.of(this).extension<AppTextTheme>()!;
}
