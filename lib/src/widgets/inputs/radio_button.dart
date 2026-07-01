import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppRadioButton extends StatelessWidget {
  final bool selected;
  final Color? activeColor;
  final Color? activeBorderColor;
  final Color? activeFillColor;
  final double size;  

  const AppRadioButton({
    super.key,
    this.selected = false,
    this.activeColor,
    this.activeBorderColor,
    this.activeFillColor,
    this.size = AppSizes.s24,    
  });

  @override
  Widget build(BuildContext context) {
    final dotColor = activeColor ?? AppColors.iconPrimary;
    final borderColor = activeBorderColor ?? AppColors.iconPrimary;
    final fillColor = activeFillColor ?? AppColors.primarySubtle;

    return Container(
      width: size,
      height: size,
      padding: EdgeInsets.all(AppSizes.s6),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: selected ? borderColor : AppColors.border,          
        ),
        color: selected ? fillColor : AppColors.white,
      ),
      child: selected
          ? Center(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: dotColor,
                ),
              ),
            )
          : const SizedBox(),
    );
  }
}
