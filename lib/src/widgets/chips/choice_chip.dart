import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppChoiceChip extends StatelessWidget {
  final bool selected;
  final String label;
  final Function(bool)? onSelected;
  final Widget? leading;

  const AppChoiceChip({
    super.key,
    this.selected = false,
    required this.label,
    this.onSelected,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return AppBoxCard(
      onTap: () => onSelected?.call(!selected),
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.s16,
        vertical: AppSizes.s8,
      ),
      border: Border.all(
        color: selected ? AppColors.borderPrimary : AppColors.border,
      ),
      borderRadius: AppRadius.rounded32,
      color: selected ? AppColors.primarySubtle : AppColors.background,
      child: Row(
        spacing: AppSizes.s8,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leading != null) leading!,
          Text(
            label,
            style: context.textTheme.bodyCaptionSemiBold.copyWith(
              color: selected ? AppColors.textPrimary : AppColors.textCaption,
            ),
          ),
        ],
      ),
    );
  }
}
