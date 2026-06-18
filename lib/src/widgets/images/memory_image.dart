import 'dart:convert';
import 'dart:typed_data';

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
    final String imageString = asset ?? '';

    Uint8List? imageBytes;

    if (imageString.isNotEmpty) {
      try {
        String cleanBase64 = imageString;
        if (imageString.contains(',')) {
          cleanBase64 = imageString.split(',').last;
        }

        imageBytes = base64Decode(cleanBase64.trim());
      } catch (e) {
        imageBytes = null;
      }
    }

    return AppBoxCard(
      width: width ?? size,
      height: height ?? size,
      margin: margin,
      padding: padding,
      borderRadius: borderRadius,
      color: backgroundColor,
      child: Visibility(
        visible: imageBytes != null,
        replacement: _buildErrorWidget,
        child: Image.memory(
          imageBytes ?? Uint8List(0),
          width: width ?? size,
          height: height ?? size,
          fit: fit,
          errorBuilder: (context, _, __) {
            return _buildErrorWidget;
          },
        ),
      ),
    );
  }

  Widget get _buildErrorWidget {
    return AppErrorImage(
      asset: errorImage,
      width: width,
      height: height,
      size: size,
      borderRadius: borderRadius,
      margin: errorMargin,
      padding: errorPadding,
    );
  }
}
