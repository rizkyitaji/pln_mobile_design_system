import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    this.size = 46,
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
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? AppRadius.zero,
        image: asset.isStandardImage
            ? DecorationImage(
                image: AssetImage(asset ?? AppAssets.imageBackgroundHeader),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: Visibility(
        visible: !asset.isStandardImage,
        child: SvgPicture.asset(asset ?? AppAssets.imageBackgroundHeader),
      ),
    );
  }
}
