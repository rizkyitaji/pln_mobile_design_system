import 'package:flutter/widgets.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

enum ContentItemType { row, column }

class AppContentItem extends StatelessWidget {
  final String? label, value;
  final ContentItemType type;
  final TextStyle? labelStyle, valueStyle;
  final Widget? labelTrailing;
  final int flex;

  const AppContentItem({
    super.key,
    this.label,
    this.value,
    this.flex = 1,
    this.labelStyle,
    this.valueStyle,
    this.labelTrailing,
    this.type = ContentItemType.row,
  });

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ContentItemType.row:
        return Row(
          spacing: AppSizes.s8,
          children: [
            Expanded(
              child: Wrap(
                spacing: AppSizes.s4,
                children: [
                  Text(
                    label ?? '-',
                    style: labelStyle ?? context.textTheme.bodyCaptionMedium,
                  ),
                  if (labelTrailing != null) labelTrailing!,
                ],
              ),
            ),
            Expanded(
              flex: flex,
              child: Text(
                value ?? '-',
                textAlign: TextAlign.end,
                style: valueStyle ?? context.textTheme.bodyCaptionSemiBold,
              ),
            ),
          ],
        );
      case ContentItemType.column:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: AppSizes.s4,
              children: [
                Text(
                  label ?? '-',
                  style: labelStyle ?? context.textTheme.bodyCaptionMedium,
                ),
                if (labelTrailing != null) labelTrailing!,
              ],
            ),
            Text(
              value ?? '-',
              style: valueStyle ?? context.textTheme.bodyCaptionSemiBold,
            ),
          ],
        );
    }
  }
}
