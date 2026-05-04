import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class DSAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? titleWidget;
  final Widget? leading;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final Color? backgroundColor;
  final Color? titleColor;
  final Color? backButtonColor;
  final VoidCallback? onBackPressed;
  final double elevation;
  final double toolbarHeight;
  final bool centerTitle;
  final bool showBackButton;

  const DSAppBar({
    super.key,
    this.title,
    this.titleWidget,
    this.leading,
    this.actions,
    this.bottom,
    this.backgroundColor,
    this.titleColor,
    this.backButtonColor,
    this.onBackPressed,
    this.elevation = 0,
    this.toolbarHeight = kToolbarHeight,
    this.centerTitle = false,
    this.showBackButton = true,
  });

  @override
  Size get preferredSize =>
      Size.fromHeight(toolbarHeight + (bottom?.preferredSize.height ?? 0));

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading:
          leading ??
          (showBackButton
              ? AppBackButton(color: backButtonColor, onPressed: onBackPressed)
              : null),
      actions: actions,
      bottom: bottom,
      backgroundColor: backgroundColor ?? AppColors.white,
      automaticallyImplyLeading: false,
      surfaceTintColor: AppColors.transparent,
      elevation: elevation,
      scrolledUnderElevation: elevation,
      centerTitle: centerTitle,
      toolbarHeight: toolbarHeight,
      titleSpacing: 0,
      title: Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child:
            titleWidget ??
            Text(
              title ?? '',
              style: AppTextStyles.headingSmall.copyWith(
                color: titleColor ?? AppColors.textHeading,
              ),
            ),
      ),
    );
  }
}
