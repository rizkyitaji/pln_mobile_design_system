import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppConfirmationBottomSheet extends StatelessWidget {
  final String? asset, title, description, cancelText, confirmText;
  final ButtonStyle? confirmButtonStyle, cancelButtonStyle;
  final VoidCallback? onCancel, onConfirm;
  final Widget? confirmIcon, cancelIcon;
  final bool canPop, useColumn;

  const AppConfirmationBottomSheet({
    super.key,
    this.asset,
    this.title,
    this.description,
    this.cancelText,
    this.confirmText,
    this.onCancel,
    this.onConfirm,
    this.confirmButtonStyle,
    this.cancelButtonStyle,
    this.confirmIcon,
    this.cancelIcon,
    this.canPop = true,
    this.useColumn = false,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canPop,
      child: AppSheetContainer(
        padding: const EdgeInsets.all(AppSizes.s16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (asset != null) ...[
              Visibility(
                visible: asset!.contains('svg'),
                replacement: Image.asset(asset ?? '', height: 160.0),
                child: SvgPicture.asset(asset ?? '', height: 160.0),
              ),
              AppSpacing.h12,
            ],
            if (title != null) ...[
              Text(
                title ?? '',
                textAlign: TextAlign.center,
                style: context.textTheme.headingSmall,
              ),
              AppSpacing.h8,
            ],
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.s24),
              child: MarkdownBody(
                data: description ?? '',
                styleSheet: MarkdownStyleSheet.fromTheme(
                  ThemeData(
                    textTheme: TextTheme(
                      bodyMedium: context.textTheme.bodyMedium,
                    ),
                  ),
                ).copyWith(textAlign: WrapAlignment.center),
              ),
            ),
            AppSpacing.h16,
            AppPersistentSheet(
              child: useColumn
                  ? Column(
                      spacing: AppSizes.s12,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed:
                                onConfirm ?? () => Navigator.pop(context, true),
                            style: confirmButtonStyle,
                            icon: confirmIcon,
                            label: Text(confirmText ?? 'Konfirmasi'),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton.icon(
                            onPressed: onCancel ?? () => Navigator.pop(context),
                            style: cancelButtonStyle,
                            icon: cancelIcon,
                            label: Text(cancelText ?? 'Batal'),
                          ),
                        ),
                      ],
                    )
                  : Row(
                      spacing: AppSizes.s12,
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: onCancel ?? () => Navigator.pop(context),
                            style: cancelButtonStyle,
                            icon: cancelIcon,
                            label: Text(
                              cancelText ?? 'Batal',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed:
                                onConfirm ?? () => Navigator.pop(context, true),
                            style: confirmButtonStyle,
                            icon: confirmIcon,
                            label: Text(
                              confirmText ?? 'Konfirmasi',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }

  static Future<T?> show<T>(
    BuildContext context, {
    String? asset,
    String? title,
    String? description,
    String? cancelText,
    String? confirmText,
    VoidCallback? onCancel,
    VoidCallback? onConfirm,
    ButtonStyle? confirmButtonStyle,
    ButtonStyle? cancelButtonStyle,
    Widget? confirmIcon,
    Widget? cancelIcon,
    bool canPop = true,
    bool useColumn = false,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      isDismissible: canPop,
      enableDrag: canPop,
      builder: (context) => AppConfirmationBottomSheet(
        asset: asset,
        title: title,
        description: description,
        cancelText: cancelText,
        confirmText: confirmText,
        onCancel: onCancel,
        onConfirm: onConfirm,
        confirmButtonStyle: confirmButtonStyle,
        cancelButtonStyle: cancelButtonStyle,
        confirmIcon: confirmIcon,
        cancelIcon: cancelIcon,
        canPop: canPop,
        useColumn: useColumn,
      ),
    );
  }
}
