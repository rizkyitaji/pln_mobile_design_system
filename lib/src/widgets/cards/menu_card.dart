import 'package:flutter/widgets.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppMenuCard extends StatelessWidget {
  final String asset, name;
  final VoidCallback? onTap;

  const AppMenuCard({
    super.key,
    required this.asset,
    required this.name,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBoxCard(
      onTap: onTap,
      color: AppColors.primarySubtle,
      padding: EdgeInsets.only(
        left: AppSizes.s6,
        right: AppSizes.s6,
        bottom: AppSizes.s6,
      ),
      child: Column(
        children: [
          AppImage(asset: asset, size: AppSizes.s56),
          AppSpacing.h2,
          Text(
            name,
            textAlign: TextAlign.center,
            style: context.textTheme.bodySmallMedium.copyWith(
              color: AppColors.textHeading,
            ),
          ),
        ],
      ),
    );
  }
}
