import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppLoadingIndicator extends StatelessWidget {
  final double? size;
  final bool primary;

  const AppLoadingIndicator({super.key, this.size, this.primary = true});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size ?? AppSizes.s24,
      width: size ?? AppSizes.s24,
      child: Lottie.asset(
        primary
            ? AppAssets.animationLoadingPrimary
            : AppAssets.animationLoadingWhite,
      ),
    );
  }
}
