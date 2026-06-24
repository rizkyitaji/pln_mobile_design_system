import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppSuccessBottomSheet<T> extends StatelessWidget {
  final String? icon, title, descriptionHtml, descriptionText;
  final String? primaryButtonText, secondaryButtonText;
  final Color? titleColor;
  final bool willPop, enableCloseButton, isFullScreen;
  final TextAlign? textAlign;
  final Widget? more, highlight;
  final ButtonStyle? primaryButtonStyle, secondaryButtonStyle;
  final double? titleSize;
  final CrossAxisAlignment crossAxisAlignment;
  final bool centerTitle, showDragHandle;
  final double? iconSize;
  
  final T? result;
  final Function(T result)? onPrimaryAction;
  final Function(T result)? onSecondaryAction;

  const AppSuccessBottomSheet({
    super.key,
    this.icon,
    this.title,
    this.descriptionHtml,
    this.descriptionText,
    this.primaryButtonText,
    this.secondaryButtonText,
    this.titleColor = Colors.black,
    this.willPop = true,
    this.textAlign,
    this.more,
    this.highlight,
    this.primaryButtonStyle,
    this.secondaryButtonStyle,
    this.enableCloseButton = false,
    this.titleSize,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.isFullScreen = false,
    this.centerTitle = true,
    this.iconSize,
    this.showDragHandle = true,
    this.result,
    this.onPrimaryAction,
    this.onSecondaryAction,
  });

  WrapAlignment _getWrapAlignment() {
    late WrapAlignment alignment;

    switch (textAlign) {
      case TextAlign.start:
        alignment = WrapAlignment.start;
        break;
      case TextAlign.end:
        alignment = WrapAlignment.end;
        break;
      default:
        alignment = WrapAlignment.center;
    }
    return alignment;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: willPop,
      child: AppSheetContainer(
        showDragHandle: showDragHandle,
        child: Column(
          crossAxisAlignment: crossAxisAlignment,
          mainAxisAlignment: isFullScreen
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          mainAxisSize: isFullScreen ? MainAxisSize.max : MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.s16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (icon != null) ...[
                    Container(
                      padding: const EdgeInsets.all(AppSizes.s16),
                      child: Center(
                        child: AppImage(
                          asset: icon!,
                          size: iconSize ?? AppSizes.s160,
                        ),
                      ),
                    ),
                    AppSpacing.h16,
                  ],
                  if (title != null) ...[
                    if (enableCloseButton) ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            title.toString(),
                            style: context.textTheme.headingSmall.copyWith(
                              color: titleColor,
                              fontSize: titleSize,
                            ),
                          ),
                          AppBackButton(icon: AppAssets.iconClose),
                        ],
                      ),
                      AppSpacing.h16,
                    ] else ...[
                      Visibility(
                        visible: centerTitle,
                        replacement: Text(
                          title.toString(),
                          textAlign: _getWrapAlignment() == WrapAlignment.center
                              ? TextAlign.center
                              : TextAlign.start,
                          style: context.textTheme.headingSmall.copyWith(
                            color: titleColor,
                            fontSize: titleSize,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            title.toString(),
                            textAlign: TextAlign.center,
                            style: context.textTheme.headingSmall.copyWith(
                              color: titleColor,
                              fontSize: titleSize,
                            ),
                          ),
                        ),
                      ),
                      AppSpacing.h16,
                    ],
                  ],
                  if (highlight != null) ...[highlight!, AppSpacing.h12],
                  if (descriptionHtml != null) ...[
                    Html(
                      data: descriptionHtml,
                      style: {
                        'body': Style(
                          margin: Margins.zero,
                          padding: HtmlPaddings.zero,
                          textAlign: textAlign ?? TextAlign.center,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: FontSize.medium,
                          lineHeight: LineHeight.number(1.3),
                        ),
                      },
                    ),
                  ],
                  if (descriptionText != null)
                    Center(
                      child: MarkdownBody(
                        data: descriptionText!,
                        styleSheet: MarkdownStyleSheet(
                          textAlign: _getWrapAlignment(),
                          p: context.textTheme.bodyMedium.copyWith(
                            color: const Color(0xFF6C6966),
                          ),
                          code: context.textTheme.bodyMedium.copyWith(
                            color: const Color(0xFFEF476F),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  if (more != null) ...[AppSpacing.h12, more!],
                ],
              ),
            ),
            AppSpacing.h16,
            AppPersistentSheet(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: onPrimaryAction != null && result != null
                          ? () => onPrimaryAction!(result as T)
                          : () => context.safePop(true),
                      style: primaryButtonStyle,
                      child: Center(
                        child: Text(
                          primaryButtonText ?? 'Verifikasi Sekarang',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  AppSpacing.h8,
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: onSecondaryAction != null && result != null
                          ? () => onSecondaryAction!(result as T)
                          : () => context.safePop(false),
                      style: secondaryButtonStyle,
                      child: Center(
                        child: Text(
                          secondaryButtonText ?? 'Lihat Detail Permohonan',
                          textAlign: TextAlign.center,
                        ),
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

  static Future<bool?> show<T>({
    required BuildContext context,
    String? icon,
    String? title,
    String? descriptionHtml,
    String? descriptionText,
    String? primaryButtonText,
    String? secondaryButtonText,
    Color? titleColor,
    bool isDismissible = true,
    bool isDraggable = true,
    bool willPop = true,
    TextAlign? textAlign,
    Widget? more,
    Widget? highlight,
    ButtonStyle? primaryButtonStyle,
    ButtonStyle? secondaryButtonStyle,
    bool enableCloseButton = false,
    double? titleSize,
    Function(T result)? onPrimaryAction,
    Function(T result)? onSecondaryAction,
    T? result,
    bool centerTitle = true,
    double? iconSize,
    bool showDragHandle = true,
  }) async {
    final information = await showModalBottomSheet<bool>(
      context: context,
      builder: (context) => AppSuccessBottomSheet<T>(
        icon: icon,
        title: title,
        descriptionHtml: descriptionHtml,
        descriptionText: descriptionText,
        primaryButtonText: primaryButtonText,
        secondaryButtonText: secondaryButtonText,
        titleColor: titleColor,
        willPop: willPop,
        textAlign: textAlign,
        more: more,
        highlight: highlight,
        primaryButtonStyle: primaryButtonStyle,
        secondaryButtonStyle: secondaryButtonStyle,
        enableCloseButton: enableCloseButton,
        titleSize: titleSize,
        onPrimaryAction: onPrimaryAction,
        onSecondaryAction: onSecondaryAction,
        result: result,
        centerTitle: centerTitle,
        iconSize: iconSize,
        showDragHandle: showDragHandle,
      ),
      isDismissible: isDismissible,
      enableDrag: isDraggable,
      isScrollControlled: true,
      backgroundColor: AppColors.transparent,
    );
    return information;
  }
}
