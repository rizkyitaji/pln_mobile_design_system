import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

extension ContextExtensions on BuildContext {
  // ===== SCREEN =====
  MediaQueryData get mq => MediaQuery.of(this);

  double get screenWidth => mq.size.width;
  double get screenHeight => mq.size.height;

  EdgeInsets get viewInsets => mq.viewInsets;
  EdgeInsets get viewPadding => mq.viewPadding;

  Orientation get orientation => mq.orientation;

  bool get isPortrait => orientation == Orientation.portrait;
  bool get isLandscape => orientation == Orientation.landscape;

  double get textScale => PlatformDispatcher.instance.textScaleFactor;

  // ===== SCALING =====
  static const double _designWidth = 344.0;

  double get _scale {
    final scale = screenWidth / _designWidth;
    return scale.clamp(0.9, 1.2);
  }

  double scaleWidth(double value) => value * _scale;

  AppTextTheme get textTheme => Theme.of(this).extension<AppTextTheme>()!;
}
