import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppPinCodeTextField extends StatelessWidget {
  final bool hasError;
  final StreamController<ErrorAnimationType>? errorAnimationController;
  final TextEditingController? controller;
  final void Function(String value)? onChanged;
  final void Function(String value)? onCompleted;
  final BorderRadius? radius;
  final bool obsecure;

  const AppPinCodeTextField({
    super.key,
    required this.hasError,
    this.errorAnimationController,
    this.controller,
    this.onChanged,
    this.onCompleted,
    this.radius,
    this.obsecure = false,
  });

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final inputWidth = deviceWidth / 7.5;

    return PinCodeTextField(
      appContext: context,
      pastedTextStyle: TextStyle(
        color: Colors.green.shade600,
        fontWeight: FontWeight.bold,
      ),
      length: 6,
      animationType: AnimationType.fade,
      hintCharacter: '_',
      hintStyle: context.textTheme.headingMedium.copyWith(
        color: AppColors.border,
      ),
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: radius ?? AppRadius.rounded12,
        fieldHeight: inputWidth * 1.5,
        fieldWidth: inputWidth,
        inactiveFillColor: AppColors.white,
        inactiveColor: AppColors.border,
        selectedColor: AppColors.primary,
        selectedFillColor: AppColors.white,
        activeFillColor: hasError ? AppColors.errorSubtle : AppColors.disabled,
        errorBorderColor: AppColors.error,
        activeColor: hasError ? AppColors.error : AppColors.border,
      ),
      showCursor: false,
      obscureText: obsecure,
      obscuringCharacter: '*',
      animationDuration: const Duration(milliseconds: 300),
      textStyle: context.textTheme.headingMedium,
      enableActiveFill: true,
      errorAnimationController: errorAnimationController,
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
      ],
      dialogConfig: DialogConfig(
        dialogTitle: 'Tempel Kode',
        dialogContent: 'Anda ingin menempel kode ini ',
        affirmativeText: 'Tempel',
        negativeText: 'Tidak',
      ),
      onChanged: onChanged,
      beforeTextPaste: (text) {
        return true;
      },
      onCompleted: onCompleted,
    );
  }
}
