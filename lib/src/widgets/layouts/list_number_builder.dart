import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppListNumberBuilder extends MarkdownElementBuilder {
  int _counter = 0;

  @override
  Widget? visitElementAfterWithContext(
    BuildContext context,
    md.Element element,
    TextStyle? preferredStyle,
    dynamic parentStyle,
  ) {
    _counter++;

    final defaultStyle = preferredStyle ?? context.textTheme.bodyMedium;

    return Row(
      spacing: AppSizes.s16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppCircleCard(
          size: AppSizes.s24,
          color: AppColors.primary,
          child: Center(
            child: Text(
              '$_counter',
              style: context.textTheme.bodyCaptionSemiBold.copyWith(
                color: AppColors.iconOnColor,
              ),
            ),
          ),
        ),
        Expanded(
          child: SelectableText.rich(
            TextSpan(children: _buildSpans(element.children, defaultStyle)),
          ),
        ),
      ],
    );
  }

  List<InlineSpan> _buildSpans(List<md.Node>? nodes, TextStyle? baseStyle) {
    if (nodes == null) return [];

    final List<InlineSpan> spans = [];

    for (final node in nodes) {
      if (node is md.Element) {
        if (node.tag == 'strong') {
          spans.add(
            TextSpan(
              text: node.textContent,
              style: baseStyle?.copyWith(fontWeight: FontWeight.bold),
            ),
          );
        } else if (node.tag == 'em') {
          spans.add(
            TextSpan(
              text: node.textContent,
              style: baseStyle?.copyWith(fontStyle: FontStyle.italic),
            ),
          );
        } else if (node.tag == 'p' || node.tag == 'br') {
          spans.addAll(_buildSpans(node.children, baseStyle));
          if (node.tag == 'p') spans.add(const TextSpan(text: '\n'));
        } else {
          spans.addAll(_buildSpans(node.children, baseStyle));
        }
      } else if (node is md.Text) {
        spans.add(TextSpan(text: node.text, style: baseStyle));
      }
    }

    return spans;
  }
}
