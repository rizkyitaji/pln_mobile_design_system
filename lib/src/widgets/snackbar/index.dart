import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

enum AppSnackBarType { success, error, info, warning }

enum AppSnackBarPosition { top, bottom }

class AppSnackBar {
  static void show({
    String? msg,
    String? description,
    AppSnackBarType? type,
    AppSnackBarPosition? position,
    VoidCallback? onTap,
    String? actionText,
    double? height,
  }) {
    var context = navigatorKey.currentContext;
    if (context != null && msg != null) {
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        snackBar(
          context: context,
          message: msg,
          description: description,
          type: type,
          position: position,
          onTap: onTap,
          actionText: actionText,
          height: height,
        ),
      );
    }
  }

  static SnackBar snackBar({
    required BuildContext context,
    required String message,
    String? description,
    AppSnackBarType? type,
    AppSnackBarPosition? position,
    VoidCallback? onTap,
    String? actionText,
    double? height,
  }) {
    if (height == null) {
      if (onTap != null) {
        height = AppSizes.s64;
      } else if (description != null) {
        height = AppSizes.s36;
      } else {
        height = AppSizes.s24;
      }
    }

    var paddingBottom =
        context.screenHeight - kToolbarHeight - context.paddingTop - height;

    switch (type) {
      case AppSnackBarType.success:
        return SnackBar(
          duration: Duration(seconds: 3),
          margin: EdgeInsets.fromLTRB(
            AppSizes.s16,
            AppSizes.zero,
            AppSizes.s16,
            position == AppSnackBarPosition.top ? paddingBottom : AppSizes.s32,
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: AppColors.successPressed,
          shape: RoundedRectangleBorder(borderRadius: AppRadius.rounded12),
          content: Row(
            spacing: AppSizes.s12,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                AppAssets.iconCheckRounded,
                width: AppSizes.s20,
                colorFilter: ColorFilter.mode(
                  AppColors.iconOnSuccess,
                  BlendMode.srcIn,
                ),
              ),
              Expanded(
                child: Column(
                  spacing: AppSizes.s2,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message,
                      style: context.textTheme.bodyMediumSemiBold.copyWith(
                        color: AppColors.textOnColorHeading,
                      ),
                    ),
                    Visibility(
                      visible: description != null,
                      child: Text(
                        description ?? '-',
                        style: context.textTheme.bodyCaption.copyWith(
                          color: AppColors.textOnColorBody,
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
                            style: context.textTheme.bodyCaptionSemiBold
                                .copyWith(color: AppColors.textOnColorHeading),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () =>
                    ScaffoldMessenger.of(context).removeCurrentSnackBar(),
                child: Icon(
                  Icons.close,
                  color: AppColors.iconOnColor,
                  size: AppSizes.s16,
                ),
              ),
            ],
          ),
        );
      case AppSnackBarType.error:
        return SnackBar(
          duration: Duration(seconds: 3),
          margin: EdgeInsets.fromLTRB(
            AppSizes.s16,
            AppSizes.zero,
            AppSizes.s16,
            position == AppSnackBarPosition.top ? paddingBottom : AppSizes.s32,
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: AppColors.errorPressed,
          shape: RoundedRectangleBorder(borderRadius: AppRadius.rounded12),
          content: Row(
            spacing: AppSizes.s12,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                AppAssets.iconInfoRounded,
                width: AppSizes.s20,
                colorFilter: ColorFilter.mode(
                  AppColors.iconOnError,
                  BlendMode.srcIn,
                ),
              ),
              Expanded(
                child: Column(
                  spacing: AppSizes.s2,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message,
                      style: context.textTheme.bodyMediumSemiBold.copyWith(
                        color: AppColors.textOnColorHeading,
                      ),
                    ),
                    Visibility(
                      visible: description != null,
                      child: Text(
                        description ?? '-',
                        style: context.textTheme.bodyCaption.copyWith(
                          color: AppColors.textOnColorBody,
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
                            style: context.textTheme.bodyCaptionSemiBold
                                .copyWith(color: AppColors.textOnColorHeading),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () =>
                    ScaffoldMessenger.of(context).removeCurrentSnackBar(),
                child: Icon(
                  Icons.close,
                  color: AppColors.iconOnColor,
                  size: AppSizes.s16,
                ),
              ),
            ],
          ),
        );
      case AppSnackBarType.info:
        return SnackBar(
          duration: Duration(seconds: 3),
          margin: EdgeInsets.fromLTRB(
            AppSizes.s16,
            AppSizes.zero,
            AppSizes.s16,
            position == AppSnackBarPosition.top ? paddingBottom : AppSizes.s32,
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: AppColors.dark,
          shape: RoundedRectangleBorder(borderRadius: AppRadius.rounded12),
          content: Row(
            spacing: AppSizes.s12,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                AppAssets.iconInfoRounded,
                width: AppSizes.s20,
                colorFilter: ColorFilter.mode(
                  AppColors.iconOnInfo,
                  BlendMode.srcIn,
                ),
              ),
              Expanded(
                child: Column(
                  spacing: AppSizes.s2,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message,
                      style: context.textTheme.bodyMediumSemiBold.copyWith(
                        color: AppColors.textOnColorHeading,
                      ),
                    ),
                    Visibility(
                      visible: description != null,
                      child: Text(
                        description ?? '-',
                        style: context.textTheme.bodyCaption.copyWith(
                          color: AppColors.textOnColorBody,
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
                            style: context.textTheme.bodyCaptionSemiBold
                                .copyWith(color: AppColors.textOnColorHeading),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () =>
                    ScaffoldMessenger.of(context).removeCurrentSnackBar(),
                child: Icon(
                  Icons.close,
                  color: AppColors.iconOnColor,
                  size: AppSizes.s16,
                ),
              ),
            ],
          ),
        );
      case AppSnackBarType.warning:
        return SnackBar(
          duration: Duration(seconds: 3),
          margin: EdgeInsets.fromLTRB(
            AppSizes.s16,
            AppSizes.zero,
            AppSizes.s16,
            position == AppSnackBarPosition.top ? paddingBottom : AppSizes.s32,
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: AppColors.textWarningPressed,
          shape: RoundedRectangleBorder(borderRadius: AppRadius.rounded12),
          content: Row(
            spacing: AppSizes.s12,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                AppAssets.iconWarning,
                width: AppSizes.s20,
                colorFilter: ColorFilter.mode(
                  AppColors.iconOnWarning,
                  BlendMode.srcIn,
                ),
              ),
              Expanded(
                child: Column(
                  spacing: AppSizes.s2,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message,
                      style: context.textTheme.bodyMediumSemiBold.copyWith(
                        color: AppColors.textOnColorHeading,
                      ),
                    ),
                    Visibility(
                      visible: description != null,
                      child: Text(
                        description ?? '-',
                        style: context.textTheme.bodyCaption.copyWith(
                          color: AppColors.textOnColorBody,
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
                            style: context.textTheme.bodyCaptionSemiBold
                                .copyWith(color: AppColors.textOnColorHeading),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () =>
                    ScaffoldMessenger.of(context).removeCurrentSnackBar(),
                child: Icon(
                  Icons.close,
                  color: AppColors.iconOnColor,
                  size: AppSizes.s16,
                ),
              ),
            ],
          ),
        );
      default:
        return SnackBar(
          duration: Duration(seconds: 3),
          margin: EdgeInsets.fromLTRB(16, 0, 16, 32),
          behavior: SnackBarBehavior.floating,
          backgroundColor: AppColors.dark,
          shape: RoundedRectangleBorder(borderRadius: AppRadius.rounded12),
          content: Row(
            spacing: AppSizes.s12,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                AppAssets.iconCheckRounded,
                width: AppSizes.s20,
                colorFilter: ColorFilter.mode(
                  AppColors.iconOnSuccess,
                  BlendMode.srcIn,
                ),
              ),
              Expanded(
                child: Column(
                  spacing: AppSizes.s2,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message,
                      style: context.textTheme.bodyMediumSemiBold.copyWith(
                        color: AppColors.textOnColorHeading,
                      ),
                    ),
                    Visibility(
                      visible: description != null,
                      child: Text(
                        description ?? '-',
                        style: context.textTheme.bodyCaption.copyWith(
                          color: AppColors.textOnColorBody,
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
                            style: context.textTheme.bodyCaptionSemiBold
                                .copyWith(color: AppColors.textOnColorHeading),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () =>
                    ScaffoldMessenger.of(context).removeCurrentSnackBar(),
                child: Icon(
                  Icons.close,
                  color: AppColors.iconOnColor,
                  size: AppSizes.s16,
                ),
              ),
            ],
          ),
        );
    }
  }
}
