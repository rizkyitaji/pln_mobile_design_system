import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppBoxLazyLoad extends StatelessWidget {
  final double? width, height;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;

  const AppBoxLazyLoad({
    super.key,
    this.width,
    this.height,
    this.margin,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? context.screenWidth,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        color: AppColors.shimmerHighlight,
        borderRadius: borderRadius ?? AppRadius.rounded8,
      ),
    );
  }
}
