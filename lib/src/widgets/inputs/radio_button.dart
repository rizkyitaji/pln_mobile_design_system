import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppRadioButton extends StatelessWidget {
  final bool selected;
  final Color activeColor, fillColor, disabledColor;
  final double size;

  const AppRadioButton({
    super.key,
    this.selected = false,
    this.activeColor = AppColors.iconPrimary,
    this.fillColor = AppColors.primarySubtle,
    this.disabledColor = AppColors.background,
    this.size = AppSizes.s24,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: selected ? activeColor : AppColors.border),
        color: selected ? fillColor : disabledColor,
      ),
      child: selected
          ? Center(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: activeColor,
                ),
              ),
            )
          : const SizedBox(),
    );
  }
}
