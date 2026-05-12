import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        child: Column(
          crossAxisAlignment: crossAxisAlignment,
          mainAxisAlignment: isFullScreen
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          mainAxisSize: isFullScreen ? MainAxisSize.max : MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (icon != null) ...[
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: icon!.contains('svg')
                            ? SvgPicture.asset(icon!, height: 160.0)
                            : Image.asset(icon!, height: 160.0),
                      ),
                    ),
                    const SizedBox(height: 16.0),
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
                          IconButton(
                            onPressed: () => AppHelper.safePop(context),
                            icon: const Icon(Icons.close),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                    ] else ...[
                      Center(
                        child: Text(
                          title.toString(),
                          textAlign: TextAlign.center,
                          style: context.textTheme.headingSmall.copyWith(
                            color: titleColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                    ],
                  ],
                  if (highlight != null) ...[
                    highlight!,
                    const SizedBox(height: 12),
                  ],
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
                    MarkdownBody(
                      data: descriptionText!,
                      styleSheet: MarkdownStyleSheet(
                        textAlign: _getWrapAlignment(),
                        p: context.textTheme.bodyMedium,
                        code: context.textTheme.bodyMedium.copyWith(
                          color: const Color(0xFFEF476F),
                        ),
                      ),
                    ),
                  if (more != null) ...[const SizedBox(height: 12), more!],
                ],
              ),
            ),
            const SizedBox(height: 32.0),
            AppPersistentSheet(
              child: useElevatedButton
                  ? ElevatedButton(
                      onPressed:
                          onTap ?? () => AppHelper.safePop(context, true),
                      style: buttonStyle,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            buttonText ?? 'Oke, Mengerti',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    )
                  : OutlinedButton(
                      onPressed:
                          onTap ?? () => AppHelper.safePop(context, true),
                      style: buttonStyle,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
      ),
      isDismissible: isDismissible,
      enableDrag: isDraggable,
      isScrollControlled: true,
    );
    return information;
  }
}
