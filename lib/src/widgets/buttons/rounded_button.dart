import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/src/constants/colors/app_colors.dart';

class AppRoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double borderRadius;
  final Widget child;

  const AppRoundedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = AppColors.white,
    this.textColor = AppColors.textPrimary,
    this.borderRadius = 20.0,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: child,
    );
  }
}
