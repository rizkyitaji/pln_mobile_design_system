import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppGeneralBottomSheet extends StatelessWidget {
  final String title;
  final String? message;
  final Widget? customChild;
  final VoidCallback? onTap;
  final String? buttonText;
  final bool showActionButton, showCloseButton;
  final double? padding;

  const AppGeneralBottomSheet({
    super.key,
    required this.title,
    this.message,
    this.customChild,
    this.onTap,
    this.buttonText,
    this.showActionButton = true,
    this.showCloseButton = true,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return AppSheetContainer(
      showDragHandle: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.s16),
                child: Row(
                  spacing: AppSizes.s12,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: context.textTheme.bodyLargeSemiBold,
                      ),
                    ),
                    if (showCloseButton) ...[
                      AppBackButton(icon: AppAssets.iconClose),
                    ],
                  ],
                ),
              ),
              AppSpacing.h16,
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: padding ?? AppSizes.s16,
                ),
                child:
                    customChild ??
                    (message != null
                        ? Text(message!, style: context.textTheme.bodyMedium)
                        : const SizedBox.shrink()),
              ),
            ],
          ),
          if (showActionButton) ...[
            AppSpacing.h16,
            AppPersistentSheet(
              child: ElevatedButton(
                onPressed: onTap,
                child: Text(buttonText ?? 'Ok'),
              ),
            ),
          ],
        ],
      ),
    );
  }

  static Future<T?> show<T>(
    BuildContext context, {
    required String title,
    String? message,
    Widget? customChild,
    VoidCallback? onTap,
    String? buttonText,
    bool showActionButton = true,
    double? padding,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isDismissible: false,
      enableDrag: false,
      isScrollControlled: true,
      builder: (context) {
        return AppGeneralBottomSheet(
          title: title,
          message: message,
          customChild: customChild,
          onTap: onTap,
          buttonText: buttonText,
          showActionButton: showActionButton,
          padding: padding,
        );
      },
    );
  }
}
