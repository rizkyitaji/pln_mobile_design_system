import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppOptionCard extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  final bool disabled;

  const AppOptionCard({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: disabled ? AppColors.disabled : AppColors.white,
        borderRadius: AppRadius.rounded12,
        border: Border.all(
          color: selected ? AppColors.borderPrimary : AppColors.border,
          width: selected ? 2 : 1,
        ),
      ),
      child: InkWell(
        borderRadius: AppRadius.rounded12,
        onTap: disabled ? null : onTap,
        child: Ink(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.s16,
            vertical: AppSizes.s14,
          ),
          child: Row(
            children: [
              AppRadioButton(selected: selected),
              const SizedBox(width: AppSizes.s12),
              Expanded(
                child: Text(label, style: context.textTheme.bodyMediumSemiBold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
