import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppLoadingDialog extends StatelessWidget {
  const AppLoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(AppSizes.s16),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: AppRadius.rounded12,
            ),
            child: Lottie.asset(
              AppAssets.animationLoading,
              width: 50,
              height: 50,
            ),
          ),
        ],
      ),
    );
  }

  static Future<void> show(
    BuildContext context, {
    bool barrierDismissible = true,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (_) => const AppLoadingDialog(),
    );
  }

  static void hide(BuildContext context) {
    Navigator.pop(context);
  }
}
