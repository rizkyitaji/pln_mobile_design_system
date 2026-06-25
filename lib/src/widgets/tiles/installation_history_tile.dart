import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

/// A reusable card tile for installation activity history items.
///
/// Displays service type, applicant name, address, amount, date,
/// and a colored status badge. Uses a dotted divider between
/// the info section and the footer.
class AppInstallationHistoryTile extends StatelessWidget {
  final String? serviceType;
  final String? applicantName;
  final String? address;
  final int? amount;
  final DateTime? createdAt;
  
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
    this.serviceType,
    this.applicantName,
    this.address,
    this.amount,
    this.createdAt,
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
    final formattedAmount = amount != null
        ? 'Rp${amount!.toStringAsFixed(0).replaceAllMapped(
              RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
              (m) => '${m[1]}.',
            )}'
        : 'Rp0';
        
    final formattedDate = createdAt != null
        ? '${createdAt!.day.toString().padLeft(2, '0')} '
            '${_monthName(createdAt!.month)} '
            '${createdAt!.year}, '
            '${createdAt!.hour.toString().padLeft(2, '0')}:${createdAt!.minute.toString().padLeft(2, '0')} WIB'
        : '-';

    return AppBoxCard(
      padding: EdgeInsets.zero,
      border: Border.all(color: AppColors.border),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // --- Top Section: Service Type & Date ---
          Padding(
            padding: EdgeInsets.fromLTRB(AppSizes.s16, AppSizes.s16, AppSizes.s16, AppSizes.s12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppImage(
                  asset: AppAssets.iconMenuPasangBaru,
                  size: AppSizes.s24,
                ),
                AppSpacing.w12,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        serviceType ?? '-',
                        style: context.textTheme.bodyMediumSemiBold.copyWith(
                          color: AppColors.textHeading,
                        ),
                      ),
                      AppSpacing.h4,
                      Text(
                        formattedDate,
                        style: context.textTheme.bodyCaption.copyWith(
                          color: AppColors.textHeading,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.s16),
            child: const AppDottedLine(),
          ),

          // --- Middle Section: Detail Info ---
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.s16, vertical: AppSizes.s16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  applicantName ?? '-',
                  style: context.textTheme.titleMedium.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                AppSpacing.h8,
                Row(
                  children: [
                    AppImage(
                      asset: AppAssets.iconHomeOutlined,
                      size: AppSizes.s20,
                      color: AppColors.iconSubtle,
                    ),
                    AppSpacing.w8,
                    Expanded(
                      child: Text(
                        address ?? '-',
                        style: context.textTheme.bodySmall.copyWith(
                          color: AppColors.textMuted,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                AppSpacing.h8,
                Row(
                  children: [
                    AppImage(
                      asset: AppAssets.iconTagihanOutlined,
                      size: AppSizes.s20,
                      color: AppColors.icon,
                    ),
                    AppSpacing.w8,
                    Expanded(
                      child: Text(
                        formattedAmount,
                        style: context.textTheme.bodyMediumMed.copyWith(
                          color: AppColors.textHeading,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.s16),
            child: const AppDottedLine(),
          ),

          // --- Bottom Section: Status & Action Button ---
          Padding(
            padding: EdgeInsets.fromLTRB(AppSizes.s16, AppSizes.s12, AppSizes.s16, AppSizes.s16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Status part
                Expanded(
                  child: Row(
                    children: [
                      AppImage(
                        asset: statusIconAsset,
                        size: AppSizes.s20,
                        color: statusIconColor,
                      ),
                      AppSpacing.w8,
                      Expanded(
                        child: Text(
                          statusLabel,
                          style: context.textTheme.bodyMediumMed.copyWith(
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
                ElevatedButton(
                  onPressed: onTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isPrimaryButton ? AppColors.primary : AppColors.white,
                    foregroundColor: isPrimaryButton ? AppColors.white : AppColors.primary,
                    side: isPrimaryButton ? BorderSide.none : BorderSide(color: AppColors.borderPrimary),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSizes.s32),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.s16,
                      vertical: AppSizes.s8,
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    buttonText,
                    style: context.textTheme.bodyCaptionSemiBold.copyWith(
                      color: isPrimaryButton ? AppColors.white : AppColors.textPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _monthName(int month) {
    const months = [
      'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
      'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember',
    ];
    return months[month - 1];
  }
}
