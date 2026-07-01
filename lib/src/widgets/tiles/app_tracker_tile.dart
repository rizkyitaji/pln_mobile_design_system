import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppTrackerTile extends StatelessWidget {
  final String title;
  final String desc;
  final String row;
  final bool isLast;
  final Color? titleColor;
  final Color? backgroundRow;
  final Color? textRow;
  final double? titleFontSize;
  final double? descFontSize;

  const AppTrackerTile({
    super.key,
    required this.title,
    required this.desc,
    required this.row,
    this.isLast = false,
    this.titleColor,
    this.backgroundRow,
    this.textRow,
    this.titleFontSize,
    this.descFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: backgroundRow ?? AppColors.primary,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  row,
                  style: context.textTheme.bodyCaptionSemiBold.copyWith(
                    color: textRow ?? AppColors.white,
                  ),
                ),
              ),
              if (!isLast)
                Expanded(child: Container(width: 1, color: AppColors.border)),
            ],
          ),
          const SizedBox(width: AppSizes.s12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.textTheme.bodyMediumSemiBold.copyWith(
                    color: titleColor,
                    fontSize: titleFontSize,
                  ),
                ),
                const SizedBox(height: AppSizes.s4),
                Text(
                  desc,
                  style: context.textTheme.bodyCaption.copyWith(
                    color: AppColors.textCaption,
                    fontSize: descFontSize,
                  ),
                ),
                const SizedBox(height: AppSizes.s24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
