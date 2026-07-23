import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppCircleLazyLoad extends StatelessWidget {
  final double? width, height, size;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final bool onColor;

  const AppCircleLazyLoad({
    super.key,
    this.width,
    this.height,
    this.size,
    this.margin,
    this.borderRadius,
    this.onColor = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? size ?? AppSizes.s24,
      height: height ?? size ?? AppSizes.s24,
      margin: margin,
      decoration: BoxDecoration(
        color: onColor
            ? AppColors.shimmerHighlightOnColor
            : AppColors.shimmerHighlight,
        shape: BoxShape.circle,
      ),
    );
  }
}
