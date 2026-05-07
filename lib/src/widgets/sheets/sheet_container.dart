import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppSheetContainer extends StatelessWidget {
  final Widget? child;
  final List<Widget> children;
  final ScrollController? controller;
  final EdgeInsetsGeometry? padding;
  final bool showDragHandle, expand;
  final ScrollPhysics? physics;

  const AppSheetContainer({
    super.key,
    this.child,
    this.padding,
    this.controller,
    this.children = const [],
    this.showDragHandle = true,
    this.expand = false,
    this.physics,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: AppRadius.topRounded12,
          color: AppColors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: AppSizes.s16),
            Visibility(
              visible: showDragHandle,
              child: Center(
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
            ),
            Visibility(
              visible: child != null,
              replacement: Visibility(
                visible: expand,
                replacement: _listView,
                child: Expanded(child: _listView),
              ),
              child: child ?? SizedBox(),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _listView {
    return ListView(
      shrinkWrap: true,
      controller: controller,
      padding: padding ?? EdgeInsets.zero,
      physics: physics ?? ClampingScrollPhysics(),
      children: children,
    );
  }
}
