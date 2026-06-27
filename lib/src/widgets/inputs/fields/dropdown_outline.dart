import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppDropdownWidget extends StatelessWidget {
  final GlobalKey<FormState>? keyForm;
  final TextEditingController? controller;
  final String label, hint;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;
  final Function(String?)? onChanged;
  final Function(String?)? onSaved;
  final bool enabled, isMandatory;
  final TextStyle? labelStyle, hintStyle;
  final Color? enabledBorderColor,
      focusedBorderColor,
      disabledBorderColor,
      errorBorderColor,
      focusedErrorBorderColor,
      suffixIconColor;
  final FocusNode? focusNode;

  const AppDropdownWidget({
    super.key,
    this.keyForm,
    this.controller,
    this.hint = '',
    this.label = '',
    this.onTap,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.enabled = true,
    this.labelStyle,
    this.hintStyle,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.disabledBorderColor,
    this.errorBorderColor,
    this.focusedErrorBorderColor,
    this.suffixIconColor,
    this.isMandatory = false,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label.isNotEmpty) ...[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                textScaler: TextScaler.noScaling,
                style:
                    labelStyle ??
                    const TextStyle(                      
                      color: AppColors.textHeading,
                    ),
              ),
              if (isMandatory) ...[
                const Text(
                  ' *',
                  textScaler: TextScaler.noScaling,
                  style: TextStyle(color: AppColors.error),
                ),
              ],
            ],
          ),
          const SizedBox(height: 8),
        ],
        Form(
          key: keyForm ?? GlobalKey<FormState>(),
          child: TextFormField(
            controller: controller,
            focusNode: focusNode,
            onTap: onTap,
            readOnly: true,
            enabled: enabled,
            validator: validator,
            onChanged: onChanged,
            onSaved: onSaved,
            minLines: 1,
            maxLines: 2,
            decoration: InputDecoration(
              filled: false,
              hintText: hint,
              hintStyle:
                  hintStyle ??
                  const TextStyle(
                    fontSize: 16,
                    color: AppColors.textPlaceholder,
                    fontWeight: FontWeight.w600,
                  ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.keyboard_arrow_down,
                    size: 22,
                    color: suffixIconColor ?? AppColors.icon,
                  ),
                  AppSpacing.w8,
                ],
              ),
              suffixIconConstraints: const BoxConstraints.expand(height: 24, width: 36),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: enabledBorderColor ?? const Color(0xFFD3D8DF),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: focusedBorderColor ?? AppColors.secondary,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: disabledBorderColor ?? AppColors.borderDisabled,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: errorBorderColor ?? AppColors.borderError,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: focusedErrorBorderColor ?? AppColors.borderError,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
