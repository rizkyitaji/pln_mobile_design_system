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
  final bool isError;
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
    this.isError = false,
    this.showTopConnector = false,
    this.showBottomConnector = true,
  });

  @override
  Widget build(BuildContext context) {
    final connectorColor = isCurrent
        ? AppColors.borderPrimary
        : AppColors.border;
    final badgeBackgroundColor = isError
        ? AppColors.iconError
        : isCurrent
        ? AppColors.primary
        : AppColors.primarySubtle;
    final iconColor = (isError || isCurrent)
        ? AppColors.iconOnColor
        : AppColors.iconPrimary;
    final titleColor = isError ? AppColors.textError : AppColors.textHeading;

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
                      ? Container(
                          width: 1,
                          decoration: BoxDecoration(
                            color: AppColors.border,
                            borderRadius: AppRadius.rounded,
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
                SizedBox(height: AppSizes.s4),
                Container(
                  width: AppSizes.s20,
                  height: AppSizes.s20,
                  padding: !isError
                      ? EdgeInsets.all(AppSizes.s4)
                      : EdgeInsets.all(AppSizes.zero),
                  decoration: BoxDecoration(
                    color: badgeBackgroundColor,
                    borderRadius: AppRadius.rounded,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      isError ? AppAssets.iconClose : AppAssets.iconCheck,
                      width: AppSizes.s16,
                      height: AppSizes.s16,
                      colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                    ),
                  ),
                ),
                SizedBox(height: AppSizes.s4),
                SizedBox(
                  height: AppSizes.s12,
                  child: showBottomConnector
                      ? Container(
                          width: 1,
                          decoration: BoxDecoration(
                            color: AppColors.border,
                            borderRadius: AppRadius.rounded,
                          ),
                        )
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
                  style: context.textTheme.bodyMediumSemiBold.copyWith(
                    color: titleColor,
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
                        style: context.textTheme.bodyCaption.copyWith(
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
