import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppErrorImage extends StatelessWidget {
  final String? asset;
  final double? width, height, size;
  final BorderRadius? borderRadius;

  const AppErrorImage({
    super.key,
    this.asset,
    this.width,
    this.height,
    this.size = 46,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? size,
      height: height ?? size,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? AppRadius.zero,
        image: DecorationImage(
          image: AssetImage(asset ?? AppAssets.imageBackgroundHeader),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
