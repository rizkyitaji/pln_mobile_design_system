import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppReadOnlyField extends StatelessWidget {
  final String? label;
  final bool required;
  final String value;
  final Widget? leading, trailing;

  const AppReadOnlyField({
    super.key,
    this.label,
    required this.value,
    this.required = false,
    this.leading,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppSizes.s8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          AppFieldLabel(label: label ?? '', required: required),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSizes.s12),
          decoration: BoxDecoration(
            color: AppColors.backgroundSecondary,
            borderRadius: AppRadius.rounded12,
            border: Border.all(color: AppColors.border),
          ),
          child: Row(
            spacing: AppSizes.s12,
            children: [
              if (leading != null) leading!,
              Expanded(
                child: Text(
                  value,
                  style: context.textTheme.bodyMedium.copyWith(
                    color: AppColors.textDisabled,
                  ),
                ),
              ),
              if (trailing != null) trailing!,
            ],
          ),
        ),
      ],
    );
  }
}
