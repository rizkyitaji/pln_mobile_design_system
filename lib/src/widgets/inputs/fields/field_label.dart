import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppFieldLabel extends StatelessWidget {
  final String label;
  final bool required;

  const AppFieldLabel({super.key, required this.label, this.required = false});

  @override
  Widget build(BuildContext context) {
    final style = context.textTheme.bodyMediumMed;

    return RichText(
      text: TextSpan(
        style: style,
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
