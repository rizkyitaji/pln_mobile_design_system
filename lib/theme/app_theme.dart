import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  // Existing Colors -- Remove when all components are migrated to use the new palette
  static ThemeData get existingTheme => ThemeData(
    useMaterial3: false,
    fontFamily: 'Nunito Sans',
    primaryColor: AppColorsExsiting.primary,
    dialogTheme: DialogThemeData(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColorsExsiting.primary,
      onPrimary: Colors.white,
      secondary: AppColorsExsiting.secondary,
      onSecondary: AppColorsExsiting.secondary,
      error: AppColorsExsiting.error,
      onError: AppColorsExsiting.error,
      surface: Colors.white,
      onSurface: AppColorsExsiting.black,
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        fontFamily: 'Nunito Sans',
      ),
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      iconTheme: IconThemeData(color: Colors.black),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.white,
      scrolledUnderElevation: 0,
    ),
    scaffoldBackgroundColor: const Color(0xFFFBFCFD),
    dividerTheme: const DividerThemeData(color: Color(0XFFF8F8F8)),
    textTheme: const TextTheme(
      labelSmall: TextStyle(
        fontSize: 10,
        letterSpacing: 0,
        fontWeight: FontWeight.w600,
        height: 1.3,
        color: AppColorsExsiting.black,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        letterSpacing: 0,
        fontWeight: FontWeight.w600,
        height: 1.3,
        color: AppColorsExsiting.black,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        height: 1.3,
        color: AppColorsExsiting.black,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        height: 1.3,
        color: AppColorsExsiting.black,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        height: 1.3,
        color: AppColorsExsiting.black,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColorsExsiting.primary,
        padding: const EdgeInsets.symmetric(vertical: 10),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 10),
        backgroundColor: AppColorsExsiting.primary,
        minimumSize: const Size(120, 32),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColorsExsiting.primary,
        padding: const EdgeInsets.symmetric(vertical: 10),
        elevation: 0,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        side: const BorderSide(color: AppColorsExsiting.primary),
      ),
    ),
    buttonTheme: ButtonThemeData(
      padding: const EdgeInsets.symmetric(vertical: 10),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      buttonColor: AppColorsExsiting.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      labelStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.black45,
      ),
      helperStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Colors.black45,
      ),
      fillColor: Colors.white,
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      focusColor: AppColorsExsiting.primary,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColorsExsiting.primary),
        borderRadius: BorderRadius.circular(8),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColorsExsiting.error),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColorsExsiting.error),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    hintColor: Colors.black45,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
    ),
    tabBarTheme: const TabBarThemeData(indicatorColor: Color(0xFFBD202E)),
  );
}
