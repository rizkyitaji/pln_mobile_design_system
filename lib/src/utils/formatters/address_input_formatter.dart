import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddressInputFormatter extends TextInputFormatter {
  final RegExp _regExp = RegExp(r"^[A-Za-z0-9\s.,/\-#]+$");

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final String textBeforeCursor = newValue.selection.textBefore(
      newValue.text,
    );

    final String filtered = newValue.text.characters
        .where((char) => _regExp.hasMatch(char))
        .join();

    final String filteredBeforeCursor = textBeforeCursor.characters
        .where((char) => _regExp.hasMatch(char))
        .join();

    return TextEditingValue(
      text: filtered,

      selection: TextSelection.collapsed(offset: filteredBeforeCursor.length),
    );
  }
}
