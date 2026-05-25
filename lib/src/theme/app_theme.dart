import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

abstract class AppTheme {
  AppTheme._();

  static ThemeData get light => ThemeData(
    useMaterial3: true,
    fontFamily: AppFonts.primary,
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    extensions: <ThemeExtension<dynamic>>[AppTextTheme.lightTextTheme],
    dividerTheme: DividerThemeData(color: AppColors.border),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: AppRadius.rounded),
        disabledBackgroundColor: AppColors.disabled,
        disabledForegroundColor: AppColors.textDisabled,
        foregroundColor: AppColors.textOnColorHeading,
        backgroundColor: AppColors.primary,
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.s10,
          horizontal: AppSizes.s24,
        ),
        elevation: 0,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shadowColor: AppColors.transparent,
        textStyle: AppTextTheme.lightTextTheme.bodyMediumSemiBold,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: AppRadius.rounded),
        side: BorderSide(
          color: AppColors.borderPrimaryPressed.withValues(alpha: .5),
        ),
        foregroundColor: AppColors.textPrimary,
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.s10,
          horizontal: AppSizes.s24,
        ),
        elevation: 0,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        textStyle: AppTextTheme.lightTextTheme.bodyMediumSemiBold,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: AppRadius.rounded8),
        foregroundColor: AppColors.textPrimary,
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.s4,
          horizontal: AppSizes.s8,
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        textStyle: AppTextTheme.lightTextTheme.bodyCaptionSemiBold,
        minimumSize: Size.zero,
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        iconSize: AppSizes.s24,
        visualDensity: VisualDensity.compact,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: EdgeInsets.zero,
      ),
    ),
    appBarTheme: AppBarThemeData(
      centerTitle: false,
      backgroundColor: AppColors.background,
      iconTheme: IconThemeData(color: AppColors.icon),
      titleTextStyle: AppTextTheme.lightTextTheme.headingSmall,
      scrolledUnderElevation: 0,
      titleSpacing: 8,
      elevation: 0,
    ),
    cardTheme: CardThemeData(
      shape: RoundedRectangleBorder(borderRadius: AppRadius.rounded12),
    ),
    checkboxTheme: CheckboxThemeData(
      side: BorderSide(color: AppColors.borderOnColorPrimary),
      checkColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.white;
        } else {
          return AppColors.transparent;
        }
      }),
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primary;
        } else {
          return AppColors.white;
        }
      }),
    ),
    inputDecorationTheme: InputDecorationThemeData(
      filled: true,
      isDense: true,
      fillColor: Colors.white,
      labelStyle: AppTextTheme.lightTextTheme.bodyMedium.copyWith(
        color: AppColors.black,
      ),
      hintStyle: AppTextTheme.lightTextTheme.bodyMedium.copyWith(
        color: AppColors.textPlaceholder,
      ),
      helperStyle: AppTextTheme.lightTextTheme.bodyCaption.copyWith(
        color: AppColors.textPlaceholder,
      ),
      errorStyle: AppTextTheme.lightTextTheme.bodyCaption.copyWith(
        color: AppColors.textError,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      focusColor: AppColors.primary,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.border),
        borderRadius: AppRadius.rounded8,
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.border),
        borderRadius: AppRadius.rounded8,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.border),
        borderRadius: AppRadius.rounded8,
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.borderError),
        borderRadius: AppRadius.rounded8,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.borderError),
        borderRadius: AppRadius.rounded8,
      ),
    ),
    textTheme: TextTheme(
      displayLarge: AppTextTheme.lightTextTheme.headingLarge,
      displayMedium: AppTextTheme.lightTextTheme.headingMedium,
      displaySmall: AppTextTheme.lightTextTheme.headingSmall,
      headlineLarge: AppTextTheme.lightTextTheme.headingLarge,
      headlineMedium: AppTextTheme.lightTextTheme.headingMedium,
      headlineSmall: AppTextTheme.lightTextTheme.headingSmall,
      titleLarge: AppTextTheme.lightTextTheme.titleLarge,
      titleMedium: AppTextTheme.lightTextTheme.titleMedium,
      titleSmall: AppTextTheme.lightTextTheme.titleSmall,
      bodyLarge: AppTextTheme.lightTextTheme.bodyLarge,
      bodyMedium: AppTextTheme.lightTextTheme.bodyMedium,
      bodySmall: AppTextTheme.lightTextTheme.bodySmall,
      labelLarge: AppTextTheme.lightTextTheme.bodyMediumSemiBold,
      labelMedium: AppTextTheme.lightTextTheme.bodyCaptionMedium,
      labelSmall: AppTextTheme.lightTextTheme.bodySmallMedium,
    ),
    primaryTextTheme: TextTheme(
      displayLarge: AppTextTheme.lightTextTheme.headingLarge,
      displayMedium: AppTextTheme.lightTextTheme.headingMedium,
      displaySmall: AppTextTheme.lightTextTheme.headingSmall,
      headlineLarge: AppTextTheme.lightTextTheme.headingLarge,
      headlineMedium: AppTextTheme.lightTextTheme.headingMedium,
      headlineSmall: AppTextTheme.lightTextTheme.headingSmall,
      titleLarge: AppTextTheme.lightTextTheme.titleLarge,
      titleMedium: AppTextTheme.lightTextTheme.titleMedium,
      titleSmall: AppTextTheme.lightTextTheme.titleSmall,
      bodyLarge: AppTextTheme.lightTextTheme.bodyLarge,
      bodyMedium: AppTextTheme.lightTextTheme.bodyMedium,
      bodySmall: AppTextTheme.lightTextTheme.bodySmall,
      labelLarge: AppTextTheme.lightTextTheme.bodyMediumSemiBold,
      labelMedium: AppTextTheme.lightTextTheme.bodyCaptionMedium,
      labelSmall: AppTextTheme.lightTextTheme.bodySmallMedium,
    ),
  );
}
