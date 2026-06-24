import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppCircleCard extends StatelessWidget {
  final double size, elevation;
  final Color color;
  final Widget? child;

  const AppCircleCard({
    super.key,
    this.elevation = AppSizes.zero,
    this.size = AppSizes.s24,
    this.color = AppColors.white,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Material(
        color: color,
        elevation: elevation,
        shape: CircleBorder(),
        child: Container(
          padding: EdgeInsets.all(AppSizes.s4),
          alignment: Alignment.center,
          child: child,
        ),
      ),
    );
  }
}
