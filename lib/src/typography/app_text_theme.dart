import 'package:flutter/material.dart';
import 'app_text_styles.dart';

class AppTextTheme extends ThemeExtension<AppTextTheme> {
  final TextStyle headingLarge;
  final TextStyle headingMedium;
  final TextStyle headingSmall;
  final TextStyle titleLarge;
  final TextStyle titleMedium;
  final TextStyle titleSmall;
  final TextStyle bodyLarge;
  final TextStyle bodyLargeMedium;
  final TextStyle bodyLargeSemiBold;
  final TextStyle bodyMedium;
  final TextStyle bodyMediumMed;
  final TextStyle bodyMediumSemiBold;
  final TextStyle bodyCaption;
  final TextStyle bodyCaptionMedium;
  final TextStyle bodyCaptionSemiBold;
  final TextStyle bodySmall;
  final TextStyle bodySmallMedium;
  final TextStyle bodySmallSemiBold;

  const AppTextTheme({
    required this.headingLarge,
    required this.headingMedium,
    required this.headingSmall,
    required this.titleLarge,
    required this.titleMedium,
    required this.titleSmall,
    required this.bodyLarge,
    required this.bodyLargeMedium,
    required this.bodyLargeSemiBold,
    required this.bodyMedium,
    required this.bodyMediumMed,
    required this.bodyMediumSemiBold,
    required this.bodyCaption,
    required this.bodyCaptionMedium,
    required this.bodyCaptionSemiBold,
    required this.bodySmall,
    required this.bodySmallMedium,
    required this.bodySmallSemiBold,
  });

  static AppTextTheme defaultTextTheme = AppTextTheme(
    headingLarge: AppTextStyles.headingLarge,
    headingMedium: AppTextStyles.headingMedium,
    headingSmall: AppTextStyles.headingSmall,
    titleLarge: AppTextStyles.titleLarge,
    titleMedium: AppTextStyles.titleMedium,
    titleSmall: AppTextStyles.titleSmall,
    bodyLarge: AppTextStyles.bodyLarge,
    bodyLargeMedium: AppTextStyles.bodyLargeMedium,
    bodyLargeSemiBold: AppTextStyles.bodyLargeSemiBold,
    bodyMedium: AppTextStyles.bodyMedium,
    bodyMediumMed: AppTextStyles.bodyMediumMed,
    bodyMediumSemiBold: AppTextStyles.bodyMediumSemiBold,
    bodyCaption: AppTextStyles.bodyCaption,
    bodyCaptionMedium: AppTextStyles.bodyCaptionMedium,
    bodyCaptionSemiBold: AppTextStyles.bodyCaptionSemiBold,
    bodySmall: AppTextStyles.bodySmall,
    bodySmallMedium: AppTextStyles.bodySmallMedium,
    bodySmallSemiBold: AppTextStyles.bodySmallSemiBold,
  );

  @override
  AppTextTheme copyWith({
    TextStyle? headingLarge,
    TextStyle? headingMedium,
    TextStyle? headingSmall,
    TextStyle? titleLarge,
    TextStyle? titleMedium,
    TextStyle? titleSmall,
    TextStyle? bodyLarge,
    TextStyle? bodyLargeMedium,
    TextStyle? bodyLargeSemiBold,
    TextStyle? bodyMedium,
    TextStyle? bodyMediumMed,
    TextStyle? bodyMediumSemiBold,
    TextStyle? bodyCaption,
    TextStyle? bodyCaptionMedium,
    TextStyle? bodyCaptionSemiBold,
    TextStyle? bodySmall,
    TextStyle? bodySmallMedium,
    TextStyle? bodySmallSemiBold,
  }) {
    return AppTextTheme(
      headingLarge: headingLarge ?? this.headingLarge,
      headingMedium: headingMedium ?? this.headingMedium,
      headingSmall: headingSmall ?? this.headingSmall,
      titleLarge: titleLarge ?? this.titleLarge,
      titleMedium: titleMedium ?? this.titleMedium,
      titleSmall: titleSmall ?? this.titleSmall,
      bodyLarge: bodyLarge ?? this.bodyLarge,
      bodyLargeMedium: bodyLargeMedium ?? this.bodyLargeMedium,
      bodyLargeSemiBold: bodyLargeSemiBold ?? this.bodyLargeSemiBold,
      bodyMedium: bodyMedium ?? this.bodyMedium,
      bodyMediumMed: bodyMediumMed ?? this.bodyMediumMed,
      bodyMediumSemiBold: bodyMediumSemiBold ?? this.bodyMediumSemiBold,
      bodyCaption: bodyCaption ?? this.bodyCaption,
      bodyCaptionMedium: bodyCaptionMedium ?? this.bodyCaptionMedium,
      bodyCaptionSemiBold: bodyCaptionSemiBold ?? this.bodyCaptionSemiBold,
      bodySmall: bodySmall ?? this.bodySmall,
      bodySmallMedium: bodySmallMedium ?? this.bodySmallMedium,
      bodySmallSemiBold: bodySmallSemiBold ?? this.bodySmallSemiBold,
    );
  }

  @override
  AppTextTheme lerp(ThemeExtension<AppTextTheme>? other, double t) {
    if (other is! AppTextTheme) return this;
    return AppTextTheme(
      headingLarge: TextStyle.lerp(headingLarge, other.headingLarge, t)!,
      headingMedium: TextStyle.lerp(headingMedium, other.headingMedium, t)!,
      headingSmall: TextStyle.lerp(headingSmall, other.headingSmall, t)!,
      titleLarge: TextStyle.lerp(titleLarge, other.titleLarge, t)!,
      titleMedium: TextStyle.lerp(titleMedium, other.titleMedium, t)!,
      titleSmall: TextStyle.lerp(titleSmall, other.titleSmall, t)!,
      bodyLarge: TextStyle.lerp(bodyLarge, other.bodyLarge, t)!,
      bodyLargeMedium: TextStyle.lerp(
        bodyLargeMedium,
        other.bodyLargeMedium,
        t,
      )!,
      bodyLargeSemiBold: TextStyle.lerp(
        bodyLargeSemiBold,
        other.bodyLargeSemiBold,
        t,
      )!,
      bodyMedium: TextStyle.lerp(bodyMedium, other.bodyMedium, t)!,
      bodyMediumMed: TextStyle.lerp(bodyMediumMed, other.bodyMediumMed, t)!,
      bodyMediumSemiBold: TextStyle.lerp(
        bodyMediumSemiBold,
        other.bodyMediumSemiBold,
        t,
      )!,
      bodyCaption: TextStyle.lerp(bodyCaption, other.bodyCaption, t)!,
      bodyCaptionMedium: TextStyle.lerp(
        bodyCaptionMedium,
        other.bodyCaptionMedium,
        t,
      )!,
      bodyCaptionSemiBold: TextStyle.lerp(
        bodyCaptionSemiBold,
        other.bodyCaptionSemiBold,
        t,
      )!,
      bodySmall: TextStyle.lerp(bodySmall, other.bodySmall, t)!,
      bodySmallMedium: TextStyle.lerp(
        bodySmallMedium,
        other.bodySmallMedium,
        t,
      )!,
      bodySmallSemiBold: TextStyle.lerp(
        bodySmallSemiBold,
        other.bodySmallSemiBold,
        t,
      )!,
    );
  }
}
