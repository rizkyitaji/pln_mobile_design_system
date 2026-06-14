import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

enum AppAlertType { success, error, info, warning }

class AppAlertCard extends StatelessWidget {
  final AppAlertType? type;
  final VoidCallback? onTap;
  final String? title, description, actionText;
  final EdgeInsetsGeometry? margin;
  final Widget? trailing;

  const AppAlertCard({
    super.key,
    this.type,
    this.onTap,
    this.title,
    this.description,
    this.actionText,
    this.margin,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return AppBoxCard(
      color: _backgroundColor,
      margin: margin,
      child: Row(
        spacing: AppSizes.s12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _icon,
          Expanded(
            child: Column(
              spacing: AppSizes.s2,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Visibility(
                  visible: title != null,
                  child: Text(
                    title ?? '',
                    style: context.textTheme.bodyCaptionSemiBold.copyWith(
                      color: _textColor,
                    ),
                  ),
                ),
                Visibility(
                  visible: description != null,
                  child: Text(
                    description ?? '',
                    style: context.textTheme.bodyCaption.copyWith(
                      color: _textColor,
                    ),
                  ),
                ),
                Visibility(
                  visible: onTap != null,
                  child: InkWell(
                    onTap: onTap,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: AppSizes.s8,
                      ),
                      child: Text(
                        actionText ?? 'OK',
                        style: context.textTheme.bodyCaptionSemiBold.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (trailing != null) trailing ?? AppSpacing.zero,
        ],
      ),
    );
  }

  Widget get _icon {
    switch (type) {
      case AppAlertType.success:
        return AppImage(
          asset: AppAssets.iconCheckRounded,
          color: AppColors.iconSuccess,
          size: AppSizes.s20,
        );
      case AppAlertType.error:
        return AppImage(
          asset: AppAssets.iconWarningRounded,
          color: AppColors.iconError,
          size: AppSizes.s20,
        );
      case AppAlertType.info:
        return AppImage(
          asset: AppAssets.iconInfoRounded,
          color: AppColors.iconInfo,
          size: AppSizes.s20,
        );
      case AppAlertType.warning:
        return AppImage(
          asset: AppAssets.iconWarningRounded,
          color: AppColors.iconWarning,
          size: AppSizes.s20,
        );
      default:
        return SizedBox();
    }
  }

  Color get _backgroundColor {
    switch (type) {
      case AppAlertType.success:
        return AppColors.successSubtle;
      case AppAlertType.error:
        return AppColors.errorSubtle;
      case AppAlertType.info:
        return AppColors.secondarySubtle;
      case AppAlertType.warning:
        return AppColors.warningSubtle;
      default:
        return AppColors.primarySubtle;
    }
  }

  Color get _textColor {
    switch (type) {
      case AppAlertType.success:
        return AppColors.textSuccessPressed;
      case AppAlertType.error:
        return AppColors.textError;
      case AppAlertType.info:
        return AppColors.textInfo;
      case AppAlertType.warning:
        return AppColors.textWarning;
      default:
        return AppColors.textPrimary;
    }
  }
}
