import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppGeneralBottomSheet extends StatelessWidget {
  final String title;
  final String? message;
  final Widget? child, action, persistentSheet;
  final VoidCallback? onTap;
  final String? buttonText;
  final bool showAction, showPersistentSheet;
  final double? padding;

  const AppGeneralBottomSheet({
    super.key,
    required this.title,
    this.message,
    this.child,
    this.onTap,
    this.buttonText,
    this.padding,
    this.action,
    this.showAction = true,
    this.persistentSheet,
    this.showPersistentSheet = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppSheetContainer(
      child: Column(
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
                if (showAction)
                  action ?? AppBackButton(icon: AppAssets.iconClose),
              ],
            ),
          ),
          AppSpacing.h16,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding ?? AppSizes.s16),
            child:
                child ??
                (message != null
                    ? Text(message!, style: context.textTheme.bodyMedium)
                    : const SizedBox.shrink()),
          ),
          if (showPersistentSheet) ...[
            AppSpacing.h16,
            AppPersistentSheet(
              child:
                  persistentSheet ??
                  ElevatedButton(
                    onPressed: onTap ?? context.safePop,
                    child: Text(buttonText ?? 'OK'),
                  ),
            ),
          ],
        ],
      ),
    );
  }

  static Future<T?> show<T>(
    BuildContext context, {
    bool isDismissable = true,
    bool enableDrag = true,
    required String title,
    String? message,
    Widget? child,
    VoidCallback? onTap,
    String? buttonText,
    double? padding,
    Widget? action,
    bool showAction = true,
    Widget? persistentSheet,
    bool showPersistentSheet = true,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isDismissible: isDismissable,
      enableDrag: enableDrag,
      isScrollControlled: true,
      builder: (context) {
        return AppGeneralBottomSheet(
          title: title,
          message: message,
          onTap: onTap,
          buttonText: buttonText,
          padding: padding,
          action: action,
          showAction: showAction,
          persistentSheet: persistentSheet,
          showPersistentSheet: showPersistentSheet,
          child: child,
        );
      },
    );
  }
}
