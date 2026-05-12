import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppPersistentSheet extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final BoxBorder? border;
  final Widget child;

  const AppPersistentSheet({
    super.key,
    this.padding,
    this.borderRadius,
    this.border,
    this.child = const SizedBox(),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding ?? EdgeInsets.all(AppSizes.s16),
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? AppRadius.topRounded12,
        border: border ?? Border(top: BorderSide(color: AppColors.border)),
        color: AppColors.white,
      ),
      child: SafeArea(top: false, child: child),
    );
  }
}
