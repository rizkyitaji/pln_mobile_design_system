import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

/// Utamakan untuk gunakan AppBar pada AppGeneralPage, jika tidak ada keperluan khusus untuk pakai widget ini maka bisa dihapus
class AppBarDefault extends StatelessWidget implements PreferredSizeWidget {
  final String? titleText;
  final Widget? title, leading;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final Color? backgroundColor;
  final Color? titleColor;
  final Color? backButtonColor;
  final VoidCallback? onBackPressed;
  final double elevation;
  final double toolbarHeight;
  final bool centerTitle;
  final bool automaticallyImplyLeading;

  const AppBarDefault({
    super.key,
    this.titleText,
    this.title,
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
    this.automaticallyImplyLeading = true,
  });

  @override
  Size get preferredSize =>
      Size.fromHeight(toolbarHeight + (bottom?.preferredSize.height ?? 0));

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading:
          leading ??
          (automaticallyImplyLeading
              ? AppBackButton(color: backButtonColor, onPressed: onBackPressed)
              : null),
      actions: actions,
      bottom: bottom,
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor ?? AppColors.background,
      surfaceTintColor: AppColors.transparent,
      elevation: elevation,
      scrolledUnderElevation: elevation,
      centerTitle: centerTitle,
      toolbarHeight: toolbarHeight,
      titleSpacing: 8,
      title:
          title ??
          Text(
            titleText ?? '',
            style: context.textTheme.headingSmall.copyWith(color: titleColor),
          ),
    );
  }
}
