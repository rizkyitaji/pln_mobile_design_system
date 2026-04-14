import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

abstract class AppTheme {
  AppTheme._();

  static ThemeData get light => ThemeData(
    useMaterial3: true,
    fontFamily: AppFonts.primary,
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    extensions: <ThemeExtension<dynamic>>[AppTextTheme.defaultTextTheme],
    dividerTheme: DividerThemeData(color: AppColors.border),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: AppRadius.rounded16),
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.primary,
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.s16,
          horizontal: AppSizes.s8,
        ),
        elevation: 0,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shadowColor: AppColors.transparent,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: AppRadius.rounded16),
        side: BorderSide(
          color: AppColors.primaryPressed.withValues(alpha: 0.75),
        ),
        foregroundColor: AppColors.textPrimary,
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.s16,
          horizontal: AppSizes.s8,
        ),
        elevation: 0,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: AppRadius.rounded16),
        foregroundColor: AppColors.primary,
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.s16,
          horizontal: AppSizes.s8,
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    ),
    appBarTheme: AppBarThemeData(
      centerTitle: false,
      backgroundColor: AppColors.background,
      iconTheme: IconThemeData(color: AppColors.icon),
      titleTextStyle: AppTextStyles.headingSmall,
      scrolledUnderElevation: 0,
      elevation: 0,
    ),
    inputDecorationTheme: InputDecorationThemeData(
      filled: true,
      isDense: true,
      fillColor: Colors.white,
      labelStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.black),
      hintStyle: AppTextStyles.bodyMedium.copyWith(
        color: AppColors.textPlaceholder,
      ),
      helperStyle: AppTextStyles.bodyCaption.copyWith(
        color: AppColors.textPlaceholder,
      ),
      errorStyle: AppTextStyles.bodyCaption.copyWith(
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
      headlineLarge: AppTextStyles.headingLarge,
      headlineMedium: AppTextStyles.headingMedium,
      headlineSmall: AppTextStyles.headingSmall,
      bodyLarge: AppTextStyles.bodyLarge,
      bodyMedium: AppTextStyles.bodyMedium,
      bodySmall: AppTextStyles.bodySmall,
    ),
    primaryTextTheme: TextTheme(
      headlineLarge: AppTextStyles.headingLarge,
      headlineMedium: AppTextStyles.headingMedium,
      headlineSmall: AppTextStyles.headingSmall,
      bodyLarge: AppTextStyles.bodyLarge,
      bodyMedium: AppTextStyles.bodyMedium,
      bodySmall: AppTextStyles.bodySmall,
    ),
  );
}
