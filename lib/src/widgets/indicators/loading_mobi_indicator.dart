import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppLoadingMobiIndicator extends StatelessWidget {
  final double width;

  const AppLoadingMobiIndicator({super.key, this.width = 100});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 100.scaleWidth,
        width: width,
        child: Column(
          children: <Widget>[
            AppLoadingIndicator(),
            AppImage(
              asset: AppAssets.animationLoadingMobi,
              size: AppSizes.s100.scaleWidth,
            ),
          ],
        ),
      ),
    );
  }
}
