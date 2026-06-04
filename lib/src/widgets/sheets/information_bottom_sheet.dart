import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppInformationBottomSheet extends StatelessWidget {
  final String? icon, title, descriptionHtml, descriptionText, buttonText;
  final Color? titleColor;
  final bool willPop, enableCloseButton, useElevatedButton, isFullScreen;
  final TextAlign? textAlign;
  final Widget? more, highlight;
  final ButtonStyle? buttonStyle;
  final CrossAxisAlignment crossAxisAlignment;
  final VoidCallback? onTap;
  final bool centerTitle, showDragHandle;
  final double? iconSize;

  const AppInformationBottomSheet({
    super.key,
    this.icon,
    this.title,
    this.descriptionHtml,
    this.descriptionText,
    this.buttonText,
    this.titleColor = Colors.black,
    this.willPop = true,
    this.textAlign,
    this.more,
    this.highlight,
    this.buttonStyle,
    this.enableCloseButton = false,
    this.useElevatedButton = true,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.isFullScreen = false,
    this.onTap,
    this.centerTitle = true,
    this.iconSize,
    this.showDragHandle = true,
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
                          height: iconSize ?? AppSizes.s160,
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
                          ),
                        ),
                        child: Center(
                          child: Text(
                            title.toString(),
                            textAlign: TextAlign.center,
                            style: context.textTheme.headingSmall.copyWith(
                              color: titleColor,
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
                          p: context.textTheme.bodyMedium,
                          code: context.textTheme.bodyMedium.copyWith(
                            color: const Color(0xFFEF476F),
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
              child: useElevatedButton
                  ? ElevatedButton(
                      onPressed: onTap ?? () => context.safePop(true),
                      style: buttonStyle,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSizes.s10,
                          ),
                          child: Text(
                            buttonText ?? 'Oke, Mengerti',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    )
                  : OutlinedButton(
                      onPressed: onTap ?? () => context.safePop(true),
                      style: buttonStyle,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSizes.s10,
                          ),
                          child: Text(
                            buttonText ?? 'Oke, Mengerti',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  static Future<bool?> show({
    required BuildContext context,
    String? icon,
    String? title,
    String? descriptionHtml,
    String? descriptionText,
    String? buttonText,
    Color? titleColor,
    bool isDismissible = true,
    bool isDraggable = true,
    bool willPop = true,
    TextAlign? textAlign,
    Widget? more,
    Widget? highlight,
    ButtonStyle? buttonStyle,
    bool enableCloseButton = false,
    bool useElevatedButton = true,
    double? titleSize,
    VoidCallback? onTap,
    bool centerTitle = true,
    double? iconSize,
    bool showDragHandle = true,
  }) async {
    final information = await showModalBottomSheet<bool>(
      context: context,
      builder: (context) => AppInformationBottomSheet(
        icon: icon,
        title: title,
        descriptionHtml: descriptionHtml,
        descriptionText: descriptionText,
        buttonText: buttonText,
        titleColor: titleColor,
        willPop: willPop,
        textAlign: textAlign,
        more: more,
        highlight: highlight,
        buttonStyle: buttonStyle,
        enableCloseButton: enableCloseButton,
        useElevatedButton: useElevatedButton,
        onTap: onTap,
        centerTitle: centerTitle,
        iconSize: iconSize,
        showDragHandle: showDragHandle,
      ),
      isDismissible: isDismissible,
      enableDrag: isDraggable,
      isScrollControlled: true,
    );
    return information;
  }
}
