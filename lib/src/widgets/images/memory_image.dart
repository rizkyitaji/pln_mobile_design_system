import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppMemoryImage extends StatelessWidget {
  final String? asset, errorImage;
  final double? width, height, size;
  final EdgeInsetsGeometry margin, padding, errorMargin, errorPadding;
  final BorderRadius borderRadius;
  final Color backgroundColor;
  final BoxFit fit;

  const AppMemoryImage({
    super.key,
    this.asset,
    this.width,
    this.height,
    this.size,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.errorMargin = EdgeInsets.zero,
    this.errorPadding = EdgeInsets.zero,
    this.borderRadius = BorderRadius.zero,
    this.backgroundColor = AppColors.transparent,
    this.fit = BoxFit.fill,
    this.errorImage,
  });

  @override
  Widget build(BuildContext context) {
    var image = asset ?? '';

    return AppBoxCard(
      width: width ?? size,
      height: height ?? size,
      margin: margin,
      padding: padding,
      borderRadius: borderRadius,
      color: backgroundColor,
      child: Visibility(
        visible: image.isNotEmpty,
        replacement: AppErrorImage(
          asset: errorImage,
          width: width,
          height: height,
          size: size,
          borderRadius: borderRadius,
          margin: errorMargin,
          padding: errorPadding,
        ),
        child: Image.memory(
          base64Decode(image),
          width: width ?? size,
          height: height ?? size,
          fit: BoxFit.fill,
          errorBuilder: (context, _, __) {
            return AppErrorImage(
              asset: errorImage,
              width: width,
              height: height,
              size: size,
              borderRadius: borderRadius,
              margin: errorMargin,
              padding: errorPadding,
            );
          },
        ),
      ),
    );
  }
}
