import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

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

  static final AppTextTheme lightTextTheme = AppTextTheme(
    headingLarge: AppTextStyles.headingLarge.copyWith(
      color: AppColors.textHeading,
    ),
    headingMedium: AppTextStyles.headingMedium.copyWith(
      color: AppColors.textHeading,
    ),
    headingSmall: AppTextStyles.headingSmall.copyWith(
      color: AppColors.textHeading,
    ),
    titleLarge: AppTextStyles.titleLarge.copyWith(color: AppColors.textHeading),
    titleMedium: AppTextStyles.titleMedium.copyWith(
      color: AppColors.textHeading,
    ),
    titleSmall: AppTextStyles.titleSmall.copyWith(color: AppColors.textHeading),
    bodyLarge: AppTextStyles.bodyLarge.copyWith(color: AppColors.textBody),
    bodyLargeMedium: AppTextStyles.bodyLargeMedium.copyWith(
      color: AppColors.textBody,
    ),
    bodyLargeSemiBold: AppTextStyles.bodyLargeSemiBold.copyWith(
      color: AppColors.textHeading,
    ),
    bodyMedium: AppTextStyles.bodyMedium.copyWith(color: AppColors.textBody),
    bodyMediumMed: AppTextStyles.bodyMediumMed.copyWith(
      color: AppColors.textBody,
    ),
    bodyMediumSemiBold: AppTextStyles.bodyMediumSemiBold.copyWith(
      color: AppColors.textBody,
    ),
    bodyCaption: AppTextStyles.bodyCaption.copyWith(
      color: AppColors.textCaption,
    ),
    bodyCaptionMedium: AppTextStyles.bodyCaptionMedium.copyWith(
      color: AppColors.textCaption,
    ),
    bodyCaptionSemiBold: AppTextStyles.bodyCaptionSemiBold.copyWith(
      color: AppColors.textCaption,
    ),
    bodySmall: AppTextStyles.bodySmall.copyWith(color: AppColors.textCaption),
    bodySmallMedium: AppTextStyles.bodySmallMedium.copyWith(
      color: AppColors.textCaption,
    ),
    bodySmallSemiBold: AppTextStyles.bodySmallSemiBold.copyWith(
      color: AppColors.textCaption,
    ),
  );

  static final AppTextTheme darkTextTheme = AppTextTheme(
    headingLarge: AppTextStyles.headingLarge.copyWith(
      color: AppColors.textOnColorHeading,
    ),
    headingMedium: AppTextStyles.headingMedium.copyWith(
      color: AppColors.textOnColorHeading,
    ),
    headingSmall: AppTextStyles.headingSmall.copyWith(
      color: AppColors.textOnColorHeading,
    ),
    titleLarge: AppTextStyles.titleLarge.copyWith(
      color: AppColors.textOnColorHeading,
    ),
    titleMedium: AppTextStyles.titleMedium.copyWith(
      color: AppColors.textOnColorHeading,
    ),
    titleSmall: AppTextStyles.titleSmall.copyWith(
      color: AppColors.textOnColorHeading,
    ),
    bodyLarge: AppTextStyles.bodyLarge.copyWith(
      color: AppColors.textOnColorBody,
    ),
    bodyLargeMedium: AppTextStyles.bodyLargeMedium.copyWith(
      color: AppColors.textOnColorBody,
    ),
    bodyLargeSemiBold: AppTextStyles.bodyLargeSemiBold.copyWith(
      color: AppColors.textOnColorHeading,
    ),
    bodyMedium: AppTextStyles.bodyMedium.copyWith(
      color: AppColors.textOnColorBody,
    ),
    bodyMediumMed: AppTextStyles.bodyMediumMed.copyWith(
      color: AppColors.textOnColorBody,
    ),
    bodyMediumSemiBold: AppTextStyles.bodyMediumSemiBold.copyWith(
      color: AppColors.textOnColorBody,
    ),
    bodyCaption: AppTextStyles.bodyCaption.copyWith(
      color: AppColors.textOnColorCaption,
    ),
    bodyCaptionMedium: AppTextStyles.bodyCaptionMedium.copyWith(
      color: AppColors.textOnColorCaption,
    ),
    bodyCaptionSemiBold: AppTextStyles.bodyCaptionSemiBold.copyWith(
      color: AppColors.textOnColorCaption,
    ),
    bodySmall: AppTextStyles.bodySmall.copyWith(
      color: AppColors.textOnColorCaption,
    ),
    bodySmallMedium: AppTextStyles.bodySmallMedium.copyWith(
      color: AppColors.textOnColorCaption,
    ),
    bodySmallSemiBold: AppTextStyles.bodySmallSemiBold.copyWith(
      color: AppColors.textOnColorCaption,
    ),
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
