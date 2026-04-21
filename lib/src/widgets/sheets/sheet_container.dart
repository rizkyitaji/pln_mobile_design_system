import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppSheetContainer extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsetsGeometry? padding;
  final ScrollController? scrollController;

  const AppSheetContainer({
    super.key,
    this.padding,
    this.scrollController,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.symmetric(vertical: AppSizes.s16),
      decoration: BoxDecoration(
        borderRadius: AppRadius.topRounded12,
        color: AppColors.white,
      ),
      child: SingleChildScrollView(
        controller: scrollController,
        physics: ClampingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 48,
                height: 4,
                margin: EdgeInsets.only(bottom: AppSizes.s12),
                decoration: BoxDecoration(
                  color: AppColors.iconOnDisabled,
                  borderRadius: AppRadius.rounded32,
                ),
              ),
            ),
            ...children,
          ],
        ),
      ),
    );
  }
}
