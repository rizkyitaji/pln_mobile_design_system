import 'package:flutter/material.dart';

import 'app_sizes.dart';

abstract class AppSpacing {
  AppSpacing._();

  // Width Spacing (Row)
  static Widget w2 = const SizedBox(width: AppSizes.s2);
  static Widget w4 = const SizedBox(width: AppSizes.s4);
  static Widget w8 = const SizedBox(width: AppSizes.s8);
  static Widget w10 = const SizedBox(width: AppSizes.s10);
  static Widget w12 = const SizedBox(width: AppSizes.s12);
  static Widget w16 = const SizedBox(width: AppSizes.s16);
  static Widget w24 = const SizedBox(width: AppSizes.s24);
  static Widget w32 = const SizedBox(width: AppSizes.s32);

  // Height Spacing (Column)
  static Widget h2 = const SizedBox(height: AppSizes.s2);
  static Widget h4 = const SizedBox(height: AppSizes.s4);
  static Widget h8 = const SizedBox(height: AppSizes.s8);
  static Widget h10 = const SizedBox(height: AppSizes.s10);
  static Widget h12 = const SizedBox(height: AppSizes.s12);
  static Widget h16 = const SizedBox(height: AppSizes.s16);
  static Widget h24 = const SizedBox(height: AppSizes.s24);
  static Widget h32 = const SizedBox(height: AppSizes.s32);
  static Widget h48 = const SizedBox(height: AppSizes.s48);
  static Widget h54 = const SizedBox(height: AppSizes.s54);
  static Widget h168 = const SizedBox(height: AppSizes.s168);
  static Widget h192 = const SizedBox(height: AppSizes.s192);
  static Widget h198 = const SizedBox(height: AppSizes.s198);
}
