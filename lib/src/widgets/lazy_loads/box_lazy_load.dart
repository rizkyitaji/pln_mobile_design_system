import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppBoxLazyLoad extends StatelessWidget {
  final double? width, height;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final bool onColor;

  const AppBoxLazyLoad({
    super.key,
    this.width,
    this.height,
    this.margin,
    this.borderRadius,
    this.onColor = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? context.screenWidth,
      height: height ?? AppSizes.s24,
      margin: margin,
      decoration: BoxDecoration(
        color: onColor
            ? AppColors.shimmerHighlightOnColor
            : AppColors.shimmerHighlight,
        borderRadius: borderRadius ?? AppRadius.rounded8,
      ),
    );
  }
}
