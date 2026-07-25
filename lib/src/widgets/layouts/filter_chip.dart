import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppFilterChip extends StatelessWidget {
  final String? selectedLabel;
  final String label;
  final VoidCallback? onPressed;
  final bool selected;

  const AppFilterChip({
    super.key,
    this.selectedLabel,
    required this.label,
    this.onPressed,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.s16,
          vertical: AppSizes.s8,
        ),
        side: BorderSide(
          color: selected ? AppColors.borderPrimary : AppColors.border,
        ),
        foregroundColor: selected
            ? AppColors.textPrimary
            : AppColors.textCaption,
        backgroundColor: selected
            ? AppColors.primarySubtle
            : AppColors.background,
      ),
      label: Text(selected ? selectedLabel ?? label : label),
      iconAlignment: IconAlignment.end,
      icon: AppImage(
        asset: AppAssets.iconChevronDown,
        size: AppSizes.s16,
        color: selected ? AppColors.iconPrimary : AppColors.icon,
      ),
    );
  }
}
