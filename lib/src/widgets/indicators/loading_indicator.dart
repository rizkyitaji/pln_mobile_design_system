import 'package:flutter/widgets.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppLoadingIndicator extends StatelessWidget {
  final double size;
  final bool primary;

  const AppLoadingIndicator({
    super.key,
    this.size = AppSizes.s24,
    this.primary = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppImage(
      asset: primary
          ? AppAssets.animationLoadingPrimary
          : AppAssets.animationLoadingWhite,
      size: size,
    );
  }
}
