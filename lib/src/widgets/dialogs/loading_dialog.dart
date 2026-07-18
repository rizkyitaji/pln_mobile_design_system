import 'package:flutter/material.dart';
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
          AppImage(asset: AppAssets.animationLoadingMobi, size: 160.scaleWidth),
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
