import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppCardLazyLoad extends StatelessWidget {
  const AppCardLazyLoad({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBoxCard(
      color: AppColors.transparent,
      border: Border.all(color: AppColors.border),
      child: Row(
        spacing: AppSizes.s12,
        children: [
          AppBoxLazyLoad(width: AppSizes.s64, height: AppSizes.s56),
          Expanded(
            child: Column(
              spacing: AppSizes.s2,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBoxLazyLoad(width: AppSizes.s150, height: AppSizes.s16),
                AppBoxLazyLoad(width: AppSizes.s100, height: AppSizes.s16),
                AppBoxLazyLoad(width: AppSizes.s80, height: AppSizes.s16),
              ],
            ),
          ),
          AppBoxLazyLoad(width: AppSizes.s24),
        ],
      ),
    );
  }
}
