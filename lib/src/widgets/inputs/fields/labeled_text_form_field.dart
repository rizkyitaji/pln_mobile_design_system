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
  final void Function(String?)? onSaved;
  final Widget? suffixIcon;
  final BoxConstraints? suffixIconConstraints;
  final Widget? prefixIcon;
  final BoxConstraints? prefixIconConstraints;
  final void Function(String)? onChanged;
  final Widget? suffixLabelIcon;
  final FocusNode? focusNode;
  final Color? fillColor;
  final Widget? suffixLabel;
  final InputBorder? border;
  final String? initialValue;
  final Widget? actionWidget;
  final double? actionWidgetSpace;
  final TextStyle? style;
  final TextStyle? labelStyle;

  const AppLabeledTextFormField({
    super.key,
    this.controller,
    required this.label,
    this.labelStyle,
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
    this.onSaved,
    this.suffixLabel,
    this.border,
    this.initialValue,
    this.actionWidget,
    this.actionWidgetSpace,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                AppFieldLabel(
                  label: label,
                  required: required,
                  style: labelStyle,
                ),
                if (suffixLabelIcon != null) ...[
                  AppSpacing.w4,
                  suffixLabelIcon ?? SizedBox(),
                ],
              ],
            ),
            suffixLabel ?? SizedBox(),
          ],
        ),
        AppSpacing.h8,
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: controller,
                readOnly: readOnly,
                style: style,
                maxLines: maxLines,
                minLines: minLines,
                initialValue: initialValue,
                maxLength: maxLength,
                keyboardType: keyboardType,
                textInputAction: textInputAction,
                textCapitalization:
                    textCapitalization ?? TextCapitalization.none,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                inputFormatters: inputFormatters,
                validator: validator,
                onTap: onTap,
                onChanged: onChanged,
                focusNode: focusNode,
                onSaved: onSaved,
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
                  border:
                      border ??
                      OutlineInputBorder(
                        borderRadius: AppRadius.rounded8,
                        borderSide: const BorderSide(color: AppColors.border),
                      ),
                  enabledBorder:
                      border ??
                      OutlineInputBorder(
                        borderRadius: AppRadius.rounded8,
                        borderSide: const BorderSide(color: AppColors.border),
                      ),
                  focusedBorder:
                      border ??
                      OutlineInputBorder(
                        borderRadius: AppRadius.rounded8,
                        borderSide: const BorderSide(
                          color: AppColors.borderPrimary,
                        ),
                      ),
                  errorBorder:
                      border ??
                      OutlineInputBorder(
                        borderRadius: AppRadius.rounded8,
                        borderSide: const BorderSide(
                          color: AppColors.borderError,
                        ),
                      ),
                  focusedErrorBorder:
                      border ??
                      OutlineInputBorder(
                        borderRadius: AppRadius.rounded8,
                        borderSide: const BorderSide(
                          color: AppColors.borderError,
                        ),
                      ),
                ),
              ),
            ),
            ...(actionWidget != null
                ? [SizedBox(width: actionWidgetSpace), actionWidget!]
                : []),
          ],
        ),
      ],
    );
  }
}
