import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppListLazyLoad extends StatelessWidget {
  final int itemCount;
  final double? leadingSize;
  final bool _isCard, useLeading;
  final EdgeInsetsGeometry? padding;
  final Widget? separator;

  const AppListLazyLoad.tile({
    super.key,
    this.itemCount = 5,
    this.leadingSize,
    this.padding,
    this.separator,
    this.useLeading = false,
  }) : _isCard = false;

  const AppListLazyLoad.card({
    super.key,
    this.itemCount = 5,
    this.leadingSize,
    this.padding,
    this.separator,
    this.useLeading = true,
  }) : _isCard = true;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: itemCount,
      padding: padding ?? EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return _isCard
            ? AppCardLazyLoad(useLeading: useLeading, leadingSize: leadingSize)
            : AppTileLazyLoad();
      },
      separatorBuilder: (context, index) => separator ?? AppSpacing.h12,
    );
  }
}
