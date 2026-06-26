import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppLabeledTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final bool required;
  final String? hintText;
  final bool readOnly;
  final int maxLines;
  final int? minLines;
  final int? maxLength;
  final String? prefixText;
  final String? counterText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization? textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final Widget? suffixIcon;
  final BoxConstraints? suffixIconConstraints;
  final Widget? prefixIcon;
  final BoxConstraints? prefixIconConstraints;
  final void Function(String)? onChanged;
  final Widget? suffixLabelIcon;
  final FocusNode? focusNode;
  final Color? fillColor;
  final TextStyle? style;

  const AppLabeledTextFormField({
    super.key,
    this.controller,
    required this.label,
    this.onChanged,
    this.required = false,
    this.hintText,
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
    this.textCapitalization,
    this.counterText,
    this.suffixIconConstraints,
    this.prefixIcon,
    this.prefixIconConstraints,
    this.suffixLabelIcon,
    this.focusNode,
    this.fillColor,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (suffixLabelIcon != null) ...[
          Row(
            children: [
              AppFieldLabel(label: label, required: required),
              AppSpacing.w4,
              suffixLabelIcon ?? SizedBox(),
            ],
          ),
        ] else ...[
          AppFieldLabel(label: label, required: required),
        ],
        AppSpacing.h8,
        TextFormField(
          controller: controller,
          readOnly: readOnly,
          style: style,
          maxLines: maxLines,
          minLines: minLines,
          maxLength: maxLength,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          inputFormatters: inputFormatters,
          validator: validator,
          onTap: onTap,
          onChanged: onChanged,
          focusNode: focusNode,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            prefixIconConstraints: prefixIconConstraints,
            prefix: prefixText != null ? Text(prefixText!) : null,
            filled: true,
            counterText: counterText,
            fillColor: fillColor,
            suffixIconConstraints: suffixIconConstraints,
            contentPadding: EdgeInsets.all(AppSizes.s12),
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
              borderSide: BorderSide(
                color: readOnly ? AppColors.border : AppColors.borderPrimary,
              ),
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
