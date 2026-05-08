import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

enum AppAlertType { success, error, info, warning }

class AppAlertCard extends StatelessWidget {
  final AppAlertType? type;
  final VoidCallback? onTap;
  final String? title, description, actionText;

  const AppAlertCard({
    super.key,
    this.type,
    this.onTap,
    this.title,
    this.description,
    this.actionText,
  });

  @override
  Widget build(BuildContext context) {
    return AppBoxCard(
      color: _backgroundColor,
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
                Text(
                  title ?? '-',
                  style: context.textTheme.bodyCaptionSemiBold.copyWith(
                    color: _textColor,
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
                        style: AppTextStyles.bodyCaptionSemiBold.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget get _icon {
    switch (type) {
      case AppAlertType.success:
        return SvgPicture.asset(
          AppAssets.iconCheckRounded,
          width: AppSizes.s20,
          colorFilter: ColorFilter.mode(AppColors.iconSuccess, BlendMode.srcIn),
        );
      case AppAlertType.error:
        return SvgPicture.asset(
          AppAssets.iconWarningRounded,
          width: AppSizes.s20,
          colorFilter: ColorFilter.mode(AppColors.iconError, BlendMode.srcIn),
        );
      case AppAlertType.info:
        return SvgPicture.asset(
          AppAssets.iconInfoRounded,
          width: AppSizes.s20,
          colorFilter: ColorFilter.mode(AppColors.iconInfo, BlendMode.srcIn),
        );
      case AppAlertType.warning:
        return SvgPicture.asset(
          AppAssets.iconWarningRounded,
          width: AppSizes.s20,
          colorFilter: ColorFilter.mode(AppColors.iconWarning, BlendMode.srcIn),
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
