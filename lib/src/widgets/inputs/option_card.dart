import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppOptionCard extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  final bool disabled;
  final TextStyle? labelStyle;
  final Widget? description;
  final double? verticalPadding, horizontalPadding;
  final BorderRadius? radius;

  const AppOptionCard({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
    this.disabled = false,
    this.labelStyle,
    this.description,
    this.verticalPadding,
    this.horizontalPadding,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: disabled ? AppColors.disabled : AppColors.white,
        borderRadius: radius ?? AppRadius.rounded12,
        border: Border.all(
          color: selected ? AppColors.borderPrimary : AppColors.border,
          width: selected ? 2 : 1,
        ),
      ),
      child: InkWell(
        borderRadius: radius ?? AppRadius.rounded12,
        onTap: disabled ? null : onTap,
        child: Ink(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding ?? AppSizes.s16,
            vertical: verticalPadding ?? AppSizes.s14,
          ),
          child: Row(
            children: [
              AppRadioButton(selected: selected),
              const SizedBox(width: AppSizes.s12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(label, style: labelStyle ?? context.textTheme.bodyMediumSemiBold),
                    if (description != null)
                      const SizedBox(height: AppSizes.s4),
                    if (description != null) description ?? const SizedBox.shrink(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
