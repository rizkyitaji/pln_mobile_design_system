import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppBoxCard extends StatelessWidget {
  final double? width, height;
  final EdgeInsetsGeometry? padding, margin;
  final BorderRadiusGeometry? borderRadius;
  final List<BoxShadow>? boxShadow;
  final Gradient? gradient;
  final BoxBorder? border;
  final String? asset;
  final Color? color;
  final Widget child;
  final VoidCallback? onTap;

  const AppBoxCard({
    super.key,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.borderRadius,
    this.boxShadow,
    this.gradient,
    this.border,
    this.asset,
    this.color,
    required this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: padding ?? EdgeInsets.all(AppSizes.s12),
        margin: margin,
        decoration: BoxDecoration(
          image: asset != null
              ? DecorationImage(image: AssetImage(asset!), fit: BoxFit.fill)
              : null,
          borderRadius: borderRadius ?? AppRadius.rounded12,
          color: color ?? AppColors.white,
          boxShadow: boxShadow,
          gradient: gradient,
          border: border,
        ),
        child: child,
      ),
    );
  }
}
