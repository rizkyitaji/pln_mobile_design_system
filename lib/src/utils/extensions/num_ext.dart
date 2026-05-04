import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

extension NumExt on num {
  static const double _designWidth = 375.0;

  double get _scale {
    var context = navigatorKey.currentContext;
    if (context == null) return 1.0;
    final scale = context.screenWidth / _designWidth;
    return scale.clamp(0.9, 1.2);
  }

  double get scaleWidth => this * _scale;

  double get sp {
    var context = navigatorKey.currentContext;
    if (context == null) return toDouble();
    return scaleWidth / context.mediaQuery.textScaler.scale(1);
  }

  String get zeroPadding {
    return toString().padLeft(2, '0');
  }
}
