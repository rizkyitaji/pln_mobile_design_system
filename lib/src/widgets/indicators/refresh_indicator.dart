import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppRefreshIndicator extends StatelessWidget {
  final Future<void> Function() onRefresh;
  final String? icon;
  final Widget child;

  const AppRefreshIndicator({
    super.key,
    required this.onRefresh,
    required this.child,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return CustomRefreshIndicator(
      onRefresh: onRefresh,
      builder: (context, child, controller) {
        return AnimatedBuilder(
          animation: controller,
          builder: (context, _) {
            var paddingTop = AppSizes.s24;

            return Stack(
              alignment: Alignment.topCenter,
              children: [
                if (controller.isLoading || controller.value > 0)
                  Positioned(
                    top: paddingTop * controller.value,
                    child: Lottie.asset(
                      icon ?? AppAssets.animationLoadingPrimary,
                      animate: controller.isLoading,
                      width: 40,
                    ),
                  ),
                Transform.translate(
                  offset: Offset(0, (paddingTop * 2) * controller.value),
                  child: child,
                ),
              ],
            );
          },
        );
      },
      child: child,
    );
  }
}
