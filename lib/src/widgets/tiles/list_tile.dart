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
  final EdgeInsets? contentPadding;
  final BoxBorder? border;
  final BorderRadiusGeometry? borderRadius;
  final bool useBorder;

  const AppListTile({
    super.key,
    this.leading,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.backgroundColor,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: AppSizes.s16,
      vertical: AppSizes.s8,
    ),
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.border,
    this.borderRadius,
    this.useBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: useBorder
          ? BoxDecoration(
              border: border ?? Border.all(color: AppColors.textOnDisabled),
              borderRadius: borderRadius ?? AppRadius.rounded12,
            )
          : null,

      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.s12),
          child: Row(
            children: [
              if (leading != null) ...[
                leading ?? const SizedBox(),
                const SizedBox(width: AppSizes.s10),
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title.toString(), style: titleTextStyle),
                    if (subtitle != null) ...[
                      Text(subtitle.toString(), style: subtitleTextStyle),
                    ],
                  ],
                ),
              ),
              if (trailing != null) ...[
                const SizedBox(width: AppSizes.s10),
                trailing ?? const SizedBox(),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
