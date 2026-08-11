import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppPhoneTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final bool required;
  final String? hintText;
  final bool readOnly;
  final String countryCode;
  final Widget? flagWidget;
  final int maxDigits;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final FocusNode? focusNode;
  final Widget? suffixIcon;
  final BoxConstraints? suffixIconConstraints;
  final TextStyle? style;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final String? initialValue;
  final String? counterText;
  final Color? fillColor;
  final InputBorder? border;

  const AppPhoneTextFormField({
    super.key,
    this.controller,
    this.label = 'No. Handphone',
    this.required = false,
    this.hintText = '81234567891',
    this.readOnly = false,
    this.countryCode = '+62',
    this.flagWidget,
    this.maxDigits = 15,
    this.inputFormatters,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.focusNode,
    this.suffixIcon,
    this.suffixIconConstraints,
    this.style,
    this.labelStyle,
    this.hintStyle,
    this.initialValue,
    this.counterText,
    this.fillColor,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final defaultInputFormatters = [
      FilteringTextInputFormatter.deny(RegExp(r'^0*')),
      FilteringTextInputFormatter.allow(RegExp('^[0-9]{0,$maxDigits}')),
    ];

    return AppLabeledTextFormField(
      controller: controller,
      label: label,
      labelStyle: labelStyle,
      hintStyle: hintStyle,
      required: required,
      hintText: hintText,
      readOnly: readOnly,
      keyboardType: TextInputType.phone,
      initialValue: initialValue,
      focusNode: focusNode,
      onSaved: onSaved,
      onChanged: onChanged,
      counterText: counterText,
      fillColor: fillColor,
      border: border,
      suffixIcon: suffixIcon,
      suffixIconConstraints: suffixIconConstraints,
      style: style,
      prefixIconConstraints: const BoxConstraints(),
      prefixIcon: Padding(
        padding: const EdgeInsets.only(
          left: AppSizes.s12,
          right: AppSizes.s8,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            flagWidget ??
                Image.asset(
                  AppAssets.imageFlagIndonesia,
                  width: AppSizes.s24,
                ),
            const SizedBox(width: AppSizes.s8),
            Text(
              countryCode,
              style: textTheme.bodyMedium?.copyWith(
                color: AppColors.textHeading,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: AppSizes.s12),
            Container(
              height: AppSizes.s24,
              width: 1,
              color: AppColors.border,
            ),
          ],
        ),
      ),
      inputFormatters: inputFormatters ?? defaultInputFormatters,
      validator: validator ??
          (value) {
            if (required && (value == null || value.isEmpty)) {
              return 'Masukkan no. handphone';
            }
            return null;
          },
    );
  }
}
