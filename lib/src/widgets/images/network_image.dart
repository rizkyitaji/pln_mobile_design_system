import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppNetworkImage extends StatelessWidget {
  final String? url, errorImage;
  final double? width, height, size;
  final EdgeInsetsGeometry? margin, padding;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final BoxFit fit;

  const AppNetworkImage({
    super.key,
    this.url,
    this.width,
    this.height,
    this.size,
    this.margin,
    this.padding,
    this.borderRadius,
    this.backgroundColor,
    this.fit = BoxFit.cover,
    this.errorImage,
  });

  @override
  Widget build(BuildContext context) {
    var imageUrl = url ?? '';

    return AppBoxCard(
      width: width ?? size,
      height: height ?? size,
      margin: margin,
      padding: padding,
      borderRadius: borderRadius,
      color: backgroundColor,
      child: Visibility(
        visible: imageUrl.isNotEmpty,
        replacement: AppErrorImage(),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          width: width ?? size,
          height: height ?? size,
          fit: fit,
          placeholder: (context, _) {
            return const Center(child: AppLoadingIndicator());
          },
          errorWidget: (context, _, __) {
            return AppErrorImage(
              asset: errorImage,
              width: width ?? size,
              height: height ?? size,
              size: size,
              borderRadius: borderRadius,
            );
          },
        ),
      ),
    );
  }
}
