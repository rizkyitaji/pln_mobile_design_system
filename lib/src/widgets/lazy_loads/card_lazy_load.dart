import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppCardLazyLoad extends StatelessWidget {
  final bool useLeading;
  final double? leadingSize;

  const AppCardLazyLoad({super.key, this.useLeading = true, this.leadingSize});

  @override
  Widget build(BuildContext context) {
    return AppBoxCard(
      color: AppColors.transparent,
      border: Border.all(color: AppColors.border),
      child: Row(
        spacing: AppSizes.s12,
        children: [
          if (useLeading)
            AppBoxLazyLoad(
              width: leadingSize ?? AppSizes.s64,
              height: leadingSize ?? AppSizes.s56,
            ),
          Expanded(
            child: Column(
              spacing: AppSizes.s8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBoxLazyLoad(width: AppSizes.s150, height: AppSizes.s16),
                AppBoxLazyLoad(width: AppSizes.s80, height: AppSizes.s16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
