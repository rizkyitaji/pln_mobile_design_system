import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppCheckboxIndicator extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?>? onChanged;
  final Color? activeColor;
  final double size;
  final double borderWidth;
  final double borderRadius;

  const AppCheckboxIndicator({
    super.key,
    this.value = false,
    this.onChanged,
    this.activeColor,
    this.size = AppSizes.s16,
    this.borderWidth = AppSizes.s2,
    this.borderRadius = AppSizes.s4,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Checkbox(
        activeColor: activeColor ?? AppColors.primary,
        splashRadius: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        side: BorderSide(color: AppColors.border, width: borderWidth),
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
