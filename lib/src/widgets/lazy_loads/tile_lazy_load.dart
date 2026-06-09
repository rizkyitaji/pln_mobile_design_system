import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppTileLazyLoad extends StatelessWidget {
  const AppTileLazyLoad({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppSizes.s12,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppBoxLazyLoad(width: AppSizes.s200),
        AppBoxLazyLoad(width: AppSizes.s100),
      ],
    );
  }
}
