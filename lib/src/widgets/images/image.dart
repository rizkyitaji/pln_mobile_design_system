import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppImage extends StatelessWidget {
  final String asset;
  final double? width, height;
  final Color? color;
  final BoxFit? fit;
  final bool? animate, repeat, reverse;

  const AppImage({
    super.key,
    required this.asset,
    this.width,
    this.height,
    this.color,
    this.fit,
    this.animate,
    this.repeat,
    this.reverse,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: asset.contains('json'),
      replacement: Visibility(
        visible: asset.contains('svg'),
        replacement: Image.asset(
          asset,
          width: width,
          height: height,
          color: color,
          fit: fit,
        ),
        child: SvgPicture.asset(
          asset,
          width: width,
          height: height,
          fit: fit ?? BoxFit.contain,
          colorFilter: color != null
              ? ColorFilter.mode(color ?? AppColors.icon, BlendMode.srcIn)
              : null,
        ),
      ),
      child: Lottie.asset(
        asset,
        width: width,
        height: height,
        fit: fit,
        repeat: repeat,
        reverse: reverse,
        animate: animate,
      ),
    );
  }
}
