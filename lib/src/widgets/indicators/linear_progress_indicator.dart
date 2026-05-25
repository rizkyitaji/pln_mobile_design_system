import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppLinearProgressIndicator extends StatelessWidget {
  final double? value, minHeight;
  final Color? color, backgroundColor;
  final Gradient? gradient;
  final BorderRadius borderRadius;

  const AppLinearProgressIndicator({
    super.key,
    this.value,
    this.color,
    this.gradient,
    this.minHeight,
    this.backgroundColor,
    this.borderRadius = BorderRadius.zero,
  });

  @override
  Widget build(BuildContext context) {
    final double clampedValue = (value ?? 0).clamp(0.0, 1.0);

    return Container(
      width: double.infinity,
      height: minHeight ?? AppSizes.s4,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth;
          final progressWidth = maxWidth * clampedValue;

          return Align(
            alignment: Alignment.centerLeft,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              width: progressWidth,
              height: minHeight,
              decoration: BoxDecoration(
                color: gradient != null ? null : color ?? AppColors.primary,
                gradient: gradient,
                borderRadius: borderRadius,
              ),
            ),
          );
        },
      ),
    );
  }
}
