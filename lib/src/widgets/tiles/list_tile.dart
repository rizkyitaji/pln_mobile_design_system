import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppListTile extends StatelessWidget {
  final Widget? leading;
  final String title;
  final TextStyle? titleTextStyle;
  final String? subtitle;
  final TextStyle? subtitleTextStyle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final BoxBorder? border;
  final BorderRadiusGeometry? borderRadius;

  const AppListTile({
    super.key,
    this.leading,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.backgroundColor,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.border,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return AppBoxCard(
      onTap: onTap,
      border: border ?? Border.all(color: AppColors.border),
      borderRadius: borderRadius,
      child: Row(
        spacing: AppSizes.s12,
        children: [
          if (leading != null) leading ?? const SizedBox(),
          Expanded(
            child: Column(
              spacing: AppSizes.s2,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: titleTextStyle),
                if (subtitle != null) ...[
                  Text(subtitle.toString(), style: subtitleTextStyle),
                ],
              ],
            ),
          ),
          if (trailing != null) trailing ?? const SizedBox(),
        ],
      ),
    );
  }
}
