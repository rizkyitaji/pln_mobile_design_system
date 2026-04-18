import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppConfirmationBottomSheet extends StatelessWidget {
  final String? asset, title, description, cancelText, confirmText;
  final VoidCallback? onCancel, onConfirm;
  final ButtonStyle? confirmButtonStyle, cancelButtonStyle;
  final TextStyle? descriptionStyle;
  final double? titleFontSize;
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
    this.titleFontSize,
    this.descriptionStyle,
    this.canPop = true,
    this.useColumn = false,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canPop,
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(AppSizes.s16),
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (asset != null) ...[
                Visibility(
                  visible: asset!.contains('svg'),
                  replacement: Image.asset(asset ?? ''),
                  child: SvgPicture.asset(asset ?? ''),
                ),
                const SizedBox(height: AppSizes.s24),
              ],
              if (title != null) ...[
                Text(
                  title ?? '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                    fontSize: titleFontSize ?? AppSizes.s24,
                  ),
                ),
                const SizedBox(height: AppSizes.s12),
              ],
              MarkdownBody(
                data: description ?? '',
                styleSheet: MarkdownStyleSheet.fromTheme(
                  ThemeData(
                    textTheme: TextTheme(
                      bodyMedium:
                          descriptionStyle ?? context.textTheme.bodyMedium,
                    ),
                  ),
                ).copyWith(textAlign: WrapAlignment.center),
              ),
              const SizedBox(height: AppSizes.s24),
              if (useColumn) ...[
                ElevatedButton(
                  onPressed: onConfirm ?? () => Navigator.pop(context),
                  style: confirmButtonStyle,
                  child: Center(child: Text(confirmText ?? 'Konfirmasi')),
                ),
                SizedBox(height: AppSizes.s12),
                OutlinedButton(
                  onPressed: onCancel ?? () => Navigator.pop(context),
                  style: cancelButtonStyle,
                  child: Center(child: Text(cancelText ?? 'Batal')),
                ),
              ] else ...[
                Row(
                  spacing: AppSizes.s12,
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: onCancel ?? () => Navigator.pop(context),
                        style: cancelButtonStyle,
                        child: Text(cancelText ?? 'Batal'),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: onConfirm ?? () => Navigator.pop(context),
                        style: confirmButtonStyle,
                        child: Text(confirmText ?? 'Konfirmasi'),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
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
    double? titleFontSize,
    TextStyle? descriptionStyle,
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
        titleFontSize: titleFontSize,
        descriptionStyle: descriptionStyle,
        canPop: canPop,
        useColumn: useColumn,
      ),
    );
  }
}
