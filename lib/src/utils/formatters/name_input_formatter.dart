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

class AliasNameInputFormatter extends TextInputFormatter {
  final RegExp _regExp = RegExp(r"^[A-Za-z0-9.\s\-'’‘]+$");

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final filtered = newValue.text.characters.where((char) {
      return _regExp.hasMatch(char);
    }).join();

    final formatted = _toTitleCase(filtered);

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: filtered.length),
    );
  }

  String _toTitleCase(String text) {
    if (text.isEmpty) return text;

    return text
        .split(' ')
        .map((word) {
          if (word.isEmpty) return word;
          return '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}';
        })
        .join(' ');
  }
}
