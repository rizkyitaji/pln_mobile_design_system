import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppPersistentSheet extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final BoxBorder? border;
  final Widget child;
  final String? asset;
  final Color backgroundColor;

  const AppPersistentSheet({
    super.key,
    this.padding,
    this.borderRadius,
    this.border,
    this.child = const SizedBox(),
    this.asset,
    this.backgroundColor = AppColors.background,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding ?? EdgeInsets.all(AppSizes.s16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius ?? AppRadius.topRounded12,
        border: border ?? Border(top: BorderSide(color: AppColors.border)),
        image: asset != null
            ? DecorationImage(image: AssetImage(asset!), fit: BoxFit.fill)
            : null,
      ),
      child: SafeArea(top: false, child: child),
    );
  }
}
