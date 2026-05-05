import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppDetailItemTile extends StatelessWidget {
  final String label;
  final String value;
  final Widget? labelTrailing;
  final EdgeInsetsGeometry padding;
  final double spacing;
  final TextStyle? labelStyle;
  final TextStyle? valueStyle;
  final VoidCallback? onTap;

  const AppDetailItemTile({
    super.key,
    required this.label,
    required this.value,
    this.labelTrailing,
    this.padding = EdgeInsets.zero,
    this.spacing = AppSizes.s4,
    this.labelStyle,
    this.valueStyle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final content = Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  label,
                  style:
                      labelStyle ??
                      AppTextStyles.bodyCaptionMedium.copyWith(
                        color: AppColors.textCaption,
                      ),
                ),
              ),
              if (labelTrailing != null) ...[
                const SizedBox(width: AppSizes.s8),
                labelTrailing!,
              ],
            ],
          ),
          SizedBox(height: spacing),
          Text(
            value,
            style:
                valueStyle ??
                AppTextStyles.bodyMediumMed.copyWith(
                  color: AppColors.textHeading,
                ),
          ),
        ],
      ),
    );

    if (onTap == null) return content;

    return InkWell(
      borderRadius: AppRadius.rounded8,
      onTap: onTap,
      child: content,
    );
  }
}
