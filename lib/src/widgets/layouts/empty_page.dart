import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppEmptyPage extends StatelessWidget {
  final String? asset, title, description, buttonText, outlinedText;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onPressed;
  final VoidCallback? onOutlinedPressed;
  final Widget? icon;
  final bool? showButton;

  const AppEmptyPage({
    super.key,
    this.asset,
    this.title,
    this.description,
    this.buttonText,
    this.padding = EdgeInsets.zero,
    this.onPressed,
    this.icon,
    this.showButton,
    this.onOutlinedPressed,
    this.outlinedText,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: padding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppImage(
              asset: asset ?? AppAssets.imageIllustrationEmptyData,
              size: AppSizes.s224,
            ),
            AppSpacing.h12,
            Text(
              title ?? 'Tidak dapat memuat data',
              style: context.textTheme.headingSmall,
              textAlign: TextAlign.center,
            ),
            AppSpacing.h8,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.s16),
              child: Text(
                description ?? 'Silakan coba lagi dalam beberapa saat',
                style: context.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
            AppSpacing.h24,
            if (showButton ?? true) ...[
              if (onPressed != null) ...[
                AppSpacing.h24,
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: onPressed,
                    label: Text(buttonText ?? 'Coba Lagi'),
                    icon: icon,
                  ),
                ),
              ],
              if (onOutlinedPressed != null) ...[
                AppSpacing.h16,
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: onOutlinedPressed,
                    label: Text(outlinedText ?? 'Coba Lagi'),
                    icon: icon,
                  ),
                ),
              ],
            ],
          ],
        ),
      ),
    );
  }
}
