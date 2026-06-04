import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppLoadingDialog extends StatelessWidget {
  final bool canPop;

  const AppLoadingDialog({super.key, this.canPop = false});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canPop,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppBoxCard(
            padding: const EdgeInsets.all(AppSizes.s16),
            child: AppImage(
              asset: AppAssets.animationLoadingPrimary,
              size: AppSizes.s50,
            ),
          ),
        ],
      ),
    );
  }

  static Future<void> show(BuildContext context, {bool canPop = false}) {
    return showDialog(
      context: context,
      builder: (_) => AppLoadingDialog(canPop: canPop),
    );
  }

  static void hide(BuildContext context) {
    context.safePop();
  }
}
