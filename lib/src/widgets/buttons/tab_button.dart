import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppTabButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;
  final double fontSize;
  final EdgeInsets padding;

  const AppTabButton({
    super.key,
    required this.label,
    this.isSelected = false,
    required this.onPressed,
    this.fontSize = AppFontSize.xs,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.transparent,
          borderRadius: AppRadius.rounded,
          border: Border.all(
            color: isSelected
                ? AppColors.borderPrimaryPressed
                : AppColors.borderPrimary,
            width: 1,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
