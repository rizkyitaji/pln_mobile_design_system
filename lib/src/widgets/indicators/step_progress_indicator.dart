import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppStepProgressIndicator extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  final String? stepLabel;
  final String? status;
  final TextStyle? stepLabelStyle;
  final TextStyle? statusStyle;
  final Color? statusColor;
  final Color? activeColor;
  final Color? inactiveColor;
  final double height;
  final BorderRadius? borderRadius;

  const AppStepProgressIndicator({
    super.key,
    required this.currentStep,
    required this.totalSteps,
    this.stepLabel,
    this.status,
    this.stepLabelStyle,
    this.statusStyle,
    this.statusColor,
    this.activeColor,
    this.inactiveColor,
    this.height = AppSizes.s8,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final active = activeColor ?? AppColors.primary;
    final inactive = inactiveColor ?? AppColors.primarySubtlePressed;
    final radius = borderRadius ?? BorderRadius.circular(100);
    final double progress = totalSteps > 0
        ? (currentStep / totalSteps).clamp(0.0, 1.0)
        : 0.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              stepLabel ?? 'Tahap $currentStep dari $totalSteps',
              style:
                  stepLabelStyle ??
                  context.textTheme.bodyMedium.copyWith(
                    color: AppColors.textHeading,
                  ),
            ),
            if (status != null && status!.isNotEmpty)
              Text(
                status!,
                style:
                    statusStyle ??
                    context.textTheme.bodyMediumSemiBold.copyWith(
                      color: statusColor ?? AppColors.textPrimary,
                    ),
              ),
          ],
        ),
        const SizedBox(height: AppSizes.s8),
        Container(
          width: double.infinity,
          height: height,
          decoration: BoxDecoration(color: inactive, borderRadius: radius),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: constraints.maxWidth * progress,
                  height: height,
                  decoration: BoxDecoration(
                    color: active,
                    borderRadius: radius,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
