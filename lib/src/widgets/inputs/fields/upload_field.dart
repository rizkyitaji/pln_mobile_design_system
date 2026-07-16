import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppUploadField extends StatelessWidget {
  final String label;
  final bool required;
  final bool loading;
  final ImageProvider? image;
  final VoidCallback onTap;
  final String changeLabel;
  final String addLabel;
  final String uploadLabel;
  final Widget? loadingWidget;
  final bool showAddButton;
  final double? height;
  final BorderRadius? borderRadius;

  const AppUploadField({
    super.key,
    required this.loading,
    required this.onTap,
    this.label = 'Foto Kondisi Saat Ini',
    this.required = false,
    this.image,
    this.changeLabel = 'Ganti Foto',
    this.addLabel = 'Tambah Foto',
    this.uploadLabel = 'Upload file atau foto',
    this.loadingWidget,
    this.showAddButton = false,
    this.height,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveOnTap = loading ? null : onTap;
    final effectiveBorderRadius = borderRadius ?? AppRadius.rounded12;
    final showActionButton = image != null || showAddButton;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: AppFieldLabel(label: label, required: required),
            ),
            if (showActionButton)
              TextButton(
                onPressed: effectiveOnTap,
                child: Text(image != null ? changeLabel : addLabel),
              ),
          ],
        ),
        AppSpacing.h8,
        if (loading) ...[
          Container(
            width: double.infinity,
            height: height,
            padding: height == null ? const EdgeInsets.all(AppSizes.s24) : null,
            decoration: BoxDecoration(
              color: AppColors.primarySubtle,
              borderRadius: effectiveBorderRadius,
            ),
            child: Center(
              child:
                  loadingWidget ??
                  SizedBox(
                    width: 36,
                    height: 36,
                    child: CircularProgressIndicator(strokeWidth: 3),
                  ),
            ),
          ),
        ] else if (image != null)
          InkWell(
            borderRadius: effectiveBorderRadius,
            onTap: effectiveOnTap,
            child: ClipRRect(
              borderRadius: effectiveBorderRadius,
              child: SizedBox(
                width: double.infinity,
                height: height ?? 190,
                child: Image(image: image!, fit: BoxFit.cover),
              ),
            ),
          )
        else
          InkWell(
            borderRadius: effectiveBorderRadius,
            onTap: effectiveOnTap,
            child: DottedBorder(
              options: RoundedRectDottedBorderOptions(
                dashPattern: const [8, 6],
                radius: effectiveBorderRadius.topLeft,
                color: AppColors.borderPrimary,
              ),
              child: Container(
                width: double.infinity,
                height: height,
                padding: height == null
                    ? const EdgeInsets.symmetric(vertical: AppSizes.s32)
                    : null,
                decoration: BoxDecoration(
                  color: AppColors.primarySubtle,
                  borderRadius: effectiveBorderRadius,
                ),
                child: Row(
                  spacing: AppSizes.s8,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppImage(
                      asset: AppAssets.iconUploadOutlined,
                      color: AppColors.iconPrimary,
                    ),
                    Text(
                      uploadLabel,
                      style: context.textTheme.bodyMediumSemiBold.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
