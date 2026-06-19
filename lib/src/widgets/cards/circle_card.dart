import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppCircleCard extends StatelessWidget {
  final double size;
  final Color? color;
  final Widget? child;

  const AppCircleCard({
    super.key,
    this.size = AppSizes.s24,
    this.color,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: child,
    );
  }
}
