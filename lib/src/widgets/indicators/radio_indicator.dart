import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppRadioIndicator extends StatelessWidget {
  final bool? selected;
  final Color? activeColor;
  final Color? activeBorderColor;
  final Color? activeFillColor;
  final double size;

  const AppRadioIndicator({
    super.key,
    this.selected = false,
    this.activeColor,
    this.activeBorderColor,
    this.activeFillColor,
    this.size = AppSizes.s16,
  });

  @override
  Widget build(BuildContext context) {
    final active = selected;
    final dotColor = activeColor ?? AppColors.primaryPressed;
    final borderColor = activeBorderColor ?? AppColors.primaryPressed;
    final fillColor = activeFillColor ?? AppColors.primarySubtle;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: (active ?? false) ? borderColor : AppColors.border,
          width: 1,
        ),
        color: (active ?? false) ? fillColor : AppColors.white,
      ),
      child: (active ?? false)
          ? Center(
              child: Container(
                width: AppSizes.s6,
                height: AppSizes.s6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: dotColor,
                ),
              ),
            )
          : const SizedBox(),
    );
  }
}
