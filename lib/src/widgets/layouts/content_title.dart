import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppContentTitle extends StatelessWidget {
  final String text;
  final String? tailText;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry padding;
  final Color? titleColor;

  const AppContentTitle({
    super.key,
    required this.text,
    this.onPressed,
    this.padding = EdgeInsets.zero,
    this.titleColor,
    this.tailText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: [
          Expanded(
            child: Text(
              text,
              style: context.textTheme.bodyLargeSemiBold.copyWith(
                color: titleColor,
              ),
            ),
          ),
          if (onPressed != null)
            TextButton(
              onPressed: onPressed,
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(borderRadius: AppRadius.rounded4),
                textStyle: context.textTheme.bodyMediumSemiBold,
              ),
              child: Text(tailText ?? 'Lihat Semua'),
            ),
        ],
      ),
    );
  }
}
