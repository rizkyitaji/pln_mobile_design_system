import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppFieldLabel extends StatelessWidget {
  final String label;
  final bool required;
  final TextStyle? style;

  const AppFieldLabel({super.key, required this.label, this.required = false, this.style});

  @override
  Widget build(BuildContext context) {
    final textStyle = style ?? context.textTheme.bodyMediumMed;

    return RichText(
      text: TextSpan(
        style: textStyle,
        children: [
          TextSpan(text: label),
          if (required)
            const TextSpan(
              text: ' *',
              style: TextStyle(color: AppColors.textError),
            ),
        ],
      ),
    );
  }
}
