import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppTimelineStepTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget? trailing;
  final Widget? subtitleLeading;
  final EdgeInsetsGeometry padding;
  final bool isCurrent;
  final bool showTopConnector;
  final bool showBottomConnector;

  const AppTimelineStepTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.trailing,
    this.subtitleLeading,
    this.padding = EdgeInsets.zero,
    this.isCurrent = false,
    this.showTopConnector = false,
    this.showBottomConnector = true,
  });

  @override
  Widget build(BuildContext context) {
    final connectorColor = isCurrent
        ? AppColors.borderPrimary
        : AppColors.border;
    final badgeBorderColor = isCurrent
        ? AppColors.primary
        : AppColors.borderPrimary;
    final badgeBackgroundColor = isCurrent
        ? AppColors.primary
        : AppColors.white;
    final iconColor = isCurrent ? AppColors.iconOnColor : AppColors.iconPrimary;

    return Padding(
      padding: padding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: AppSizes.s20,
            child: Column(
              children: [
                SizedBox(
                  height: AppSizes.s12,
                  child: showTopConnector
                      ? Container(width: 1, color: connectorColor)
                      : const SizedBox.shrink(),
                ),
                Container(
                  width: AppSizes.s20,
                  height: AppSizes.s20,
                  decoration: BoxDecoration(
                    color: badgeBackgroundColor,
                    borderRadius: AppRadius.rounded,
                    border: Border.all(color: badgeBorderColor),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      AppAssets.iconCheck,
                      width: AppSizes.s12,
                      height: AppSizes.s12,
                      colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppSizes.s12,
                  child: showBottomConnector
                      ? Container(width: 1, color: connectorColor)
                      : const SizedBox.shrink(),
                ),
              ],
            ),
          ),
          const SizedBox(width: AppSizes.s12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.bodyMediumSemiBold.copyWith(
                    color: AppColors.textHeading,
                  ),
                ),
                const SizedBox(height: AppSizes.s4),
                Row(
                  children: [
                    subtitleLeading ??
                        SvgPicture.asset(
                          AppAssets.iconCalendarOutlined,
                          width: AppSizes.s14,
                          height: AppSizes.s14,
                          colorFilter: ColorFilter.mode(
                            AppColors.iconDisabled,
                            BlendMode.srcIn,
                          ),
                        ),
                    const SizedBox(width: AppSizes.s4),
                    Expanded(
                      child: Text(
                        subtitle,
                        style: AppTextStyles.bodyCaption.copyWith(
                          color: AppColors.textPlaceholder,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (trailing != null) ...[
            const SizedBox(width: AppSizes.s12),
            trailing!,
          ],
        ],
      ),
    );
  }
}
