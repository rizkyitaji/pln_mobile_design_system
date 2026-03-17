import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
    useMaterial3: true,
    fontFamily: AppFonts.primary,
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    extensions: <ThemeExtension<dynamic>>[AppTextTheme.defaultTextTheme],
    dividerTheme: DividerThemeData(color: AppColors.border),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: AppRadius.md),
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.primary,
        padding: EdgeInsets.symmetric(
          vertical: AppSpacing.lg,
          horizontal: AppSpacing.sm,
        ),
        elevation: 0,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shadowColor: AppColors.transparent,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: AppRadius.md),
        side: BorderSide(
          color: AppColors.primaryPressed.withValues(alpha: 0.75),
        ),
        foregroundColor: AppColors.textPrimary,
        padding: EdgeInsets.symmetric(
          vertical: AppSpacing.lg,
          horizontal: AppSpacing.sm,
        ),
        elevation: 0,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: AppRadius.md),
        foregroundColor: AppColors.primary,
        padding: EdgeInsets.symmetric(
          vertical: AppSpacing.lg,
          horizontal: AppSpacing.sm,
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
        borderRadius: AppRadius.xs,
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.border),
        borderRadius: AppRadius.xs,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.border),
        borderRadius: AppRadius.xs,
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.borderError),
        borderRadius: AppRadius.xs,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.borderError),
        borderRadius: AppRadius.xs,
      ),
    ),
  );
}
