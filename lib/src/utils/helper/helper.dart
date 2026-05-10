import 'package:flutter/material.dart';

class AppHelper {
  static void safePop<T extends Object?>(BuildContext context, [T? result]) {
    if (Navigator.canPop(context)) {
      Navigator.pop<T>(context, result);
    }
  }
}
