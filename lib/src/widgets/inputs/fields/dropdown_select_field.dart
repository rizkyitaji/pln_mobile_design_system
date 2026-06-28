import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppDropdownSelectField extends StatelessWidget {
  final String label;
  final String value;
  final bool required;
  final VoidCallback onTap;

  const AppDropdownSelectField({
    super.key,
    required this.label,
    required this.value,
    required this.onTap,
    this.required = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppFieldLabel(
          label: label,
          required: required,
          style: context.textTheme.bodyMediumSemiBold,
        ),
        const SizedBox(height: AppSizes.s8),
        InkWell(
          onTap: onTap,
          borderRadius: AppRadius.rounded8,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.s16,
              vertical: AppSizes.s12,
            ),
            decoration: BoxDecoration(
              borderRadius: AppRadius.rounded8,
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  value,
                  style: context.textTheme.bodyMediumMed.copyWith(
                    color: AppColors.textHeading,
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: AppColors.iconDisabled,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
