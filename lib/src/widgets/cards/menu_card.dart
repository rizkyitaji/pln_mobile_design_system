import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppMenuCard extends StatelessWidget {
  final String asset, name;
  final VoidCallback? onTap;
  final Color? color;
  final String? badgeText;
  final Color? badgeColor;
  final Widget? badge;
  final double? iconSize;

  const AppMenuCard({
    super.key,
    required this.asset,
    required this.name,
    this.onTap,
    this.color,
    this.badgeText,
    this.badgeColor,
    this.badge,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: AppSizes.s56,
                decoration: BoxDecoration(
                  color: color ?? AppColors.primarySubtle,
                  borderRadius: AppRadius.rounded12,
                ),
                alignment: Alignment.center,
                child: AppImage(asset: asset, size: iconSize ?? AppSizes.s56),
              ),
              if (badge != null)
                Positioned(
                  top: -6,
                  left: 0,
                  right: 0,
                  child: Center(child: badge!),
                )
              else if (badgeText != null && badgeText!.isNotEmpty)
                Positioned(
                  top: -6,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.s8,
                        vertical: AppSizes.s2,
                      ),
                      decoration: BoxDecoration(
                        color: badgeColor ?? AppColors.errorPressed,
                        borderRadius: AppRadius.rounded12,
                      ),
                      child: Text(
                        badgeText!,
                        style: context.textTheme.bodyCaptionSemiBold.copyWith(
                          color: AppColors.white,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: AppSizes.s6),
          Text(
            name,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.bodyCaptionMedium.copyWith(
              color: AppColors.textHeading,
            ),
          ),
        ],
      ),
    );
  }
}
