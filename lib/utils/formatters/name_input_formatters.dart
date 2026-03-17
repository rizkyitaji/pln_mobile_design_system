import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NameInputFormatter extends TextInputFormatter {
  final RegExp _regExp = RegExp(r"^[A-Za-z.\s\-'’‘]+$");

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final filtered = newValue.text.characters.where((char) {
      return _regExp.hasMatch(char);
    }).join();

    return TextEditingValue(
      text: filtered,
      selection: TextSelection.collapsed(offset: filtered.length),
    );
  }
}
