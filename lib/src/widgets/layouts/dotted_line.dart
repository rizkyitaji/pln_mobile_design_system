import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppDottedLine extends StatelessWidget {
  const AppDottedLine({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedLine(dashLength: 5.5, dashColor: AppColors.border);
  }
}
