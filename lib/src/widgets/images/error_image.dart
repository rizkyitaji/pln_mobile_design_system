import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppErrorImage extends StatelessWidget {
  final String? asset;
  final double? width, height, size;
  final EdgeInsetsGeometry? margin, padding;
  final BorderRadius? borderRadius;

  const AppErrorImage({
    super.key,
    this.asset,
    this.width,
    this.height,
    this.size = AppSizes.s48,
    this.margin,
    this.padding,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? size,
      height: height ?? size,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(borderRadius: borderRadius ?? AppRadius.zero),
      child: AppImage(
        asset: asset ?? AppAssets.imagePlaceholderDefault,
        width: width ?? size,
        height: height ?? size,
      ),
    );
  }
}
