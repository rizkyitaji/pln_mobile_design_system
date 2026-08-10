import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

/// A reusable card tile for installation activity history items.
///
/// Displays service type, applicant name, address, amount, date,
/// and a colored status badge. Uses a dotted divider between
/// the info section and the footer.
class AppInstallationHistoryTile extends StatelessWidget {
  final String? serviceLabel;
  final String? serviceIcon;

  final String? title;

  final String? infoLabel;
  final String? infoIcon;

  final double? amount;
  final DateTime? date;

  // Status configuration
  final String statusLabel;
  final String statusIconAsset;
  final Color statusIconColor;
  final Color statusTextColor;

  // Button configuration
  final String buttonText;
  final bool isPrimaryButton;
  final VoidCallback? onTap;

  const AppInstallationHistoryTile({
    super.key,
    this.serviceLabel,
    this.serviceIcon,
    this.title,
    this.infoLabel,
    this.infoIcon,
    this.amount,
    this.date,
    required this.statusLabel,
    required this.statusIconAsset,
    required this.statusIconColor,
    required this.statusTextColor,
    required this.buttonText,
    this.isPrimaryButton = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBoxCard(
      padding: EdgeInsets.all(AppSizes.s12),
      border: Border.all(color: AppColors.border),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // --- Top Section: Service Type & Date ---
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppImage(
                asset: serviceIcon ?? AppAssets.iconMenuPasangBaru,
                size: AppSizes.s24,
              ),
              AppSpacing.w4,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      serviceLabel ?? '-',
                      style: context.textTheme.bodyCaptionSemiBold.copyWith(
                        color: AppColors.textHeading,
                      ),
                    ),
                    Text(
                      date.formatddMMMMyHHmmWIB,
                      style: context.textTheme.bodyCaption.copyWith(
                        color: AppColors.textHeading,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const AppDottedLine(
            padding: EdgeInsets.symmetric(vertical: AppSizes.s8),
          ),

          // --- Middle Section: Detail Info ---
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title ?? '-',
                style: context.textTheme.bodyMediumSemiBold,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              AppSpacing.h4,
              Row(
                children: [
                  AppImage(
                    asset: infoIcon ?? AppAssets.iconHomeOutlined,
                    size: AppSizes.s14,
                    color: AppColors.iconSubtle,
                  ),
                  AppSpacing.w4,
                  Expanded(
                    child: Text(
                      infoLabel ?? '-',
                      style: context.textTheme.bodySmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              if (amount != null) ...[
                AppSpacing.h8,
                Row(
                  children: [
                    AppImage(
                      asset: AppAssets.iconTagihanOutlined,
                      size: AppSizes.s16,
                      color: AppColors.icon,
                    ),
                    AppSpacing.w8,
                    Expanded(
                      child: Text(
                        amount.toIDR(),
                        style: context.textTheme.bodyCaptionMedium,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),

          const AppDottedLine(
            padding: EdgeInsets.symmetric(vertical: AppSizes.s12),
          ),

          // --- Bottom Section: Status & Action Button ---
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Status part
              Expanded(
                child: Row(
                  children: [
                    AppImage(
                      asset: statusIconAsset,
                      size: AppSizes.s16,
                      color: statusIconColor,
                    ),
                    AppSpacing.w4,
                    Expanded(
                      child: Text(
                        statusLabel,
                        style: context.textTheme.bodyCaptionMedium.copyWith(
                          color: statusTextColor,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              AppSpacing.w16,
              // Action button
              isPrimaryButton
                  ? ElevatedButton(
                      onPressed: onTap,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.fromLTRB(
                          AppSizes.s16,
                          0,
                          AppSizes.s16,
                          AppSizes.s4,
                        ),
                      ),
                      child: Text(buttonText),
                    )
                  : OutlinedButton(
                      onPressed: onTap,
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.fromLTRB(
                          AppSizes.s16,
                          0,
                          AppSizes.s16,
                          AppSizes.s4,
                        ),
                      ),
                      child: Text(buttonText),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
