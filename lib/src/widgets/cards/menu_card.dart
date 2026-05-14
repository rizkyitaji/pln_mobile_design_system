import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppMenuCard extends StatelessWidget {
  final String asset, name;

  const AppMenuCard({super.key, required this.asset, required this.name});

  @override
  Widget build(BuildContext context) {
    return AppBoxCard(
      color: AppColors.primarySubtle,
      padding: EdgeInsets.only(
        left: AppSizes.s8,
        right: AppSizes.s8,
        bottom: AppSizes.s8,
      ),
      child: Column(
        children: [
          SvgPicture.asset(asset, width: AppSizes.s56, height: AppSizes.s56),
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
