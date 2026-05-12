import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';
import 'package:shimmer/shimmer.dart';

class AppLazyLoad extends StatelessWidget {
  final bool visible;
  final Widget onLoad, child;

  const AppLazyLoad({
    super.key,
    required this.visible,
    required this.onLoad,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      replacement: child,
      child: Shimmer.fromColors(
        baseColor: AppColors.shimmerBase,
        highlightColor: AppColors.shimmerHighlight,
        child: onLoad,
      ),
    );
  }
}
