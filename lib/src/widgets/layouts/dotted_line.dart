import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppDottedLine extends StatelessWidget {
  final EdgeInsetsGeometry padding;

  const AppDottedLine({super.key, this.padding = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: DottedLine(dashLength: 5.5, dashColor: AppColors.border),
    );
  }
}
