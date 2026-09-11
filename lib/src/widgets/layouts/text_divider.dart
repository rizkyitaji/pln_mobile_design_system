import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppTextDivider extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final Color? lineColor;
  final double spacing;
  final double thickness;

  const AppTextDivider({
    super.key,
    required this.text,
    this.textStyle,
    this.lineColor,
    this.spacing = AppSizes.s12,
    this.thickness = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    final border = lineColor ?? AppColors.border;
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: border,
            thickness: thickness,
            height: thickness,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: spacing),
          child: Text(
            text,
            style: textStyle ??
                context.textTheme.bodyCaption.copyWith(
                  color: AppColors.textPlaceholder,
                ),
          ),
        ),
        Expanded(
          child: Divider(
            color: border,
            thickness: thickness,
            height: thickness,
          ),
        ),
      ],
    );
  }
}
