import 'package:flutter/material.dart';

import 'app_font_size.dart';
import 'app_font_weight.dart';
import 'app_fonts.dart';
import 'app_line_height.dart';

abstract class AppTextStyles {
  AppTextStyles._();

  static final String _package = 'pln_mobile_design_system';

  static double _height(double lineHeight, double fontSize) {
    return lineHeight / fontSize;
  }

  static final TextStyle _textStyle = TextStyle(
    package: _package,
    fontFamily: AppFonts.primary,
  );

  static TextStyle headingLarge = _textStyle.copyWith(
    fontSize: AppFontSize.xxl,
    fontWeight: AppFontWeight.semibold,
    height: _height(AppLineHeight.xl, AppFontSize.xxl),
  );

  static TextStyle headingMedium = _textStyle.copyWith(
    fontSize: AppFontSize.xl,
    fontWeight: AppFontWeight.semibold,
    height: _height(AppLineHeight.lg, AppFontSize.xl),
  );

  static TextStyle headingSmall = _textStyle.copyWith(
    fontSize: AppFontSize.lg,
    fontWeight: AppFontWeight.semibold,
    height: _height(AppLineHeight.lg, AppFontSize.lg),
  );

  static TextStyle titleLarge = _textStyle.copyWith(
    fontSize: AppFontSize.md,
    fontWeight: AppFontWeight.semibold,
    height: _height(AppLineHeight.md, AppFontSize.md),
  );

  static TextStyle titleMedium = _textStyle.copyWith(
    fontSize: AppFontSize.sm,
    fontWeight: AppFontWeight.semibold,
    height: _height(AppLineHeight.sm, AppFontSize.sm),
  );

  static TextStyle titleSmall = _textStyle.copyWith(
    fontSize: AppFontSize.xs,
    fontWeight: AppFontWeight.semibold,
    height: _height(AppLineHeight.xs, AppFontSize.xs),
  );

  static TextStyle bodyLarge = _textStyle.copyWith(
    fontSize: AppFontSize.md,
    fontWeight: AppFontWeight.regular,
    height: _height(AppLineHeight.md, AppFontSize.md),
  );

  static TextStyle bodyLargeMedium = _textStyle.copyWith(
    fontSize: AppFontSize.md,
    fontWeight: AppFontWeight.medium,
    height: _height(AppLineHeight.md, AppFontSize.md),
  );

  static TextStyle bodyLargeSemiBold = _textStyle.copyWith(
    fontSize: AppFontSize.md,
    fontWeight: AppFontWeight.semibold,
    height: _height(AppLineHeight.md, AppFontSize.md),
  );

  static TextStyle bodyMedium = _textStyle.copyWith(
    fontSize: AppFontSize.sm,
    fontWeight: AppFontWeight.regular,
    height: _height(AppLineHeight.sm, AppFontSize.sm),
  );

  static TextStyle bodyMediumMed = _textStyle.copyWith(
    fontSize: AppFontSize.sm,
    fontWeight: AppFontWeight.medium,
    height: _height(AppLineHeight.sm, AppFontSize.sm),
  );

  static TextStyle bodyMediumSemiBold = _textStyle.copyWith(
    fontSize: AppFontSize.sm,
    fontWeight: AppFontWeight.semibold,
    height: _height(AppLineHeight.sm, AppFontSize.sm),
  );

  static TextStyle bodyCaption = _textStyle.copyWith(
    fontSize: AppFontSize.xs,
    fontWeight: AppFontWeight.regular,
    height: _height(AppLineHeight.xs, AppFontSize.xs),
  );

  static TextStyle bodyCaptionMedium = _textStyle.copyWith(
    fontSize: AppFontSize.xs,
    fontWeight: AppFontWeight.medium,
    height: _height(AppLineHeight.xs, AppFontSize.xs),
  );

  static TextStyle bodyCaptionSemiBold = _textStyle.copyWith(
    fontSize: AppFontSize.xs,
    fontWeight: AppFontWeight.semibold,
    height: _height(AppLineHeight.xs, AppFontSize.xs),
  );

  static TextStyle bodySmall = _textStyle.copyWith(
    fontSize: AppFontSize.xxs,
    fontWeight: AppFontWeight.regular,
    height: _height(AppLineHeight.xxs, AppFontSize.xxs),
  );

  static TextStyle bodySmallMedium = _textStyle.copyWith(
    fontSize: AppFontSize.xxs,
    fontWeight: AppFontWeight.medium,
    height: _height(AppLineHeight.xxs, AppFontSize.xxs),
  );

  static TextStyle bodySmallSemiBold = _textStyle.copyWith(
    fontSize: AppFontSize.xxs,
    fontWeight: AppFontWeight.semibold,
    height: _height(AppLineHeight.xxs, AppFontSize.xxs),
  );
}
