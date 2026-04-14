import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppBoxCard extends StatelessWidget {
  final double? width, height;
  final EdgeInsetsGeometry? padding, margin;
  final BorderRadiusGeometry? borderRadius;
  final List<BoxShadow>? boxShadow;
  final BoxBorder? border;
  final Color? color;
  final Widget child;

  const AppBoxCard({
    super.key,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.borderRadius,
    this.boxShadow,
    this.border,
    this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding ?? EdgeInsets.all(AppSizes.s12),
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? AppRadius.rounded12,
        color: color ?? AppColors.white,
        boxShadow: boxShadow,
        border: border,
      ),
      child: child,
    );
  }
}
