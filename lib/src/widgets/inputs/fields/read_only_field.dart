import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppReadOnlyField extends StatelessWidget {
  final String label;
  final bool required;
  final String value;
  final Widget? trailing;

  const AppReadOnlyField({
    super.key,
    required this.label,
    required this.value,
    this.required = false,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppFieldLabel(label: label, required: required),
        const SizedBox(height: AppSizes.s8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.s16,
            vertical: AppSizes.s14,
          ),
          decoration: BoxDecoration(
            color: AppColors.backgroundSecondary,
            borderRadius: AppRadius.rounded12,
            border: Border.all(color: AppColors.border),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  value,
                  style: context.textTheme.bodyLarge.copyWith(
                    color: AppColors.textHeading,
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
