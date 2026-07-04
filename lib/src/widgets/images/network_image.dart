import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppNetworkImage extends StatelessWidget {
  final String? url, errorImage;
  final double? width, height, size;
  final EdgeInsetsGeometry margin, padding, errorMargin, errorPadding;
  final BorderRadius borderRadius;
  final Color backgroundColor;
  final VoidCallback? onTap;
  final BoxFit fit;
  final Color? color;
  final Alignment alignment;

  const AppNetworkImage({
    super.key,
    this.url,
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
    this.onTap,
    this.color,
    this.alignment = Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
    var imageUrl = url ?? '';

    return AppBoxCard(
      onTap: onTap,
      width: width ?? size,
      height: height ?? size,
      margin: margin,
      padding: padding,
      borderRadius: borderRadius,
      color: backgroundColor,
      child: Visibility(
        visible: imageUrl.isNotEmpty,
        replacement: AppErrorImage(
          asset: errorImage,
          width: width,
          height: height,
          size: size,
          borderRadius: borderRadius,
          margin: errorMargin,
          padding: errorPadding,
        ),
        child: ClipRRect(
          borderRadius: borderRadius,
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            width: width ?? size,
            color: color,
            height: height ?? size,
            alignment: alignment,
            fit: fit,
            placeholder: (context, _) {
              return const Center(child: AppLoadingIndicator());
            },
            errorWidget: (context, _, __) {
              return AppErrorImage(
                asset: errorImage,
                width: width,
                height: height,
                size: size,
                fit: fit,
                borderRadius: borderRadius,
                margin: errorMargin,
                padding: errorPadding,
              );
            },
          ),
        ),
      ),
    );
  }
}
