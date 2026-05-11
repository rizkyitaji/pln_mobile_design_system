import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppFieldLabel extends StatelessWidget {
  final String label;
  final bool required;

  const AppFieldLabel({super.key, required this.label, this.required = false});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(
      context,
    ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500);

    return RichText(
      text: TextSpan(
        style: style,
        children: [
          TextSpan(text: label),
          if (required)
            const TextSpan(
              text: ' *',
              style: TextStyle(color: AppColors.textError),
            ),
        ],
      ),
    );
  }
}

class AppReadOnlyField extends StatelessWidget {
  final String label;
  final bool required;
  final String value;
  final Widget? trailing;

  const AppReadOnlyField({
    super.key,
    required this.label,
    required this.value,
    this.required = false,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppFieldLabel(label: label, required: required),
        const SizedBox(height: AppSizes.s8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.s16,
            vertical: AppSizes.s14,
          ),
          decoration: BoxDecoration(
            color: AppColors.backgroundSecondary,
            borderRadius: AppRadius.rounded12,
            border: Border.all(color: AppColors.border),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  value,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(color: AppColors.textHeading),
                ),
              ),
              if (trailing != null) trailing!,
            ],
          ),
        ),
      ],
    );
  }
}

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
    final textTheme = Theme.of(context).textTheme;
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
        const SizedBox(height: AppSizes.s8),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.cloud_upload_outlined,
                      color: AppColors.iconPrimary,
                    ),
                    const SizedBox(width: AppSizes.s8),
                    Text(
                      uploadLabel,
                      style: textTheme.titleMedium?.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w700,
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

class AppOptionCard extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const AppOptionCard({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      child: InkWell(
        borderRadius: AppRadius.rounded12,
        onTap: onTap,
        child: Ink(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.s16,
            vertical: AppSizes.s14,
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: AppRadius.rounded12,
            border: Border.all(
              color: selected ? AppColors.borderPrimary : AppColors.border,
            ),
          ),
          child: Row(
            children: [
              Icon(
                selected
                    ? Icons.radio_button_checked_rounded
                    : Icons.radio_button_unchecked_rounded,
                color: selected
                    ? AppColors.iconPrimary
                    : AppColors.iconDisabled,
              ),
              const SizedBox(width: AppSizes.s12),
              Expanded(
                child: Text(
                  label,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textHeading,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppLabeledTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool required;
  final String hintText;
  final bool readOnly;
  final int maxLines;
  final int? minLines;
  final int? maxLength;
  final String? prefixText;
  final String? counterText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final Widget? suffixIcon;
  final BoxConstraints? suffixIconConstraints;
  final void Function(String)? onChanged;

  const AppLabeledTextFormField({
    super.key,
    required this.controller,
    required this.label,
    required this.onChanged,
    this.required = false,
    required this.hintText,
    this.readOnly = false,
    this.maxLines = 1,
    this.maxLength,
    this.minLines,
    this.prefixText,
    this.keyboardType,
    this.inputFormatters,
    this.validator,
    this.onTap,
    this.suffixIcon,
    this.textInputAction,
    this.counterText,
    this.suffixIconConstraints,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppFieldLabel(label: label, required: required),
        const SizedBox(height: AppSizes.s8),
        AppRoundedTextFormField(
          controller: controller,
          readOnly: readOnly,
          maxLines: maxLines,
          minLines: minLines,
          maxLength: maxLength,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          inputFormatters: inputFormatters,
          validator: validator,
          onTap: onTap,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcon,
            prefix: prefixText != null ? Text(prefixText!) : null,
            filled: true,
            counterText: counterText,
            fillColor: AppColors.white,
            suffixIconConstraints: suffixIconConstraints,
            contentPadding: EdgeInsets.symmetric(
              horizontal: AppSizes.s16,
              vertical: maxLines > 1 ? AppSizes.s14 : AppSizes.s12,
            ),
            border: OutlineInputBorder(
              borderRadius: AppRadius.rounded8,
              borderSide: const BorderSide(color: AppColors.border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: AppRadius.rounded8,
              borderSide: const BorderSide(color: AppColors.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: AppRadius.rounded8,
              borderSide: const BorderSide(color: AppColors.borderPrimary),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: AppRadius.rounded8,
              borderSide: const BorderSide(color: AppColors.borderError),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: AppRadius.rounded8,
              borderSide: const BorderSide(color: AppColors.borderError),
            ),
          ),
        ),
      ],
    );
  }
}
