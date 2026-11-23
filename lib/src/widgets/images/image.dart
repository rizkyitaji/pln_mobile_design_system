import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppImage extends StatelessWidget {
  final String asset;
  final double? width, height, size;
  final Color? color;
  final BoxFit? fit;
  final AlignmentGeometry? alignment;
  final double? scale;
  final bool? animate, repeat, reverse;
  final BorderRadius? borderRadius;

  const AppImage({
    super.key,
    required this.asset,
    this.width,
    this.height,
    this.size,
    this.color,
    this.fit,
    this.alignment,
    this.scale,
    this.animate,
    this.repeat,
    this.reverse,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;

    if (asset.endsWith('.json') ||
        asset.contains('.json') ||
        asset.contains('animation')) {
      imageWidget = Lottie.asset(
        asset,
        width: width ?? size,
        height: height ?? size,
        fit: fit,
        alignment: (alignment as Alignment?) ?? Alignment.center,
        repeat: repeat,
        reverse: reverse,
        animate: animate,
      );
    } else if (asset.endsWith('.svg') || asset.contains('.svg')) {
      imageWidget = SvgPicture.asset(
        asset,
        width: width ?? size,
        height: height ?? size,
        fit: fit ?? BoxFit.contain,
        alignment: alignment ?? Alignment.center,
        colorFilter: color != null
            ? ColorFilter.mode(color ?? AppColors.icon, BlendMode.srcIn)
            : null,
      );
    } else {
      imageWidget = Image.asset(
        asset,
        width: width ?? size,
        height: height ?? size,
        color: color,
        fit: fit,
        alignment: alignment ?? Alignment.center,
        scale: scale,
      );
    }

    if (borderRadius != null && borderRadius != BorderRadius.zero) {
      return ClipRRect(borderRadius: borderRadius!, child: imageWidget);
    }

    return imageWidget;
  }
}
