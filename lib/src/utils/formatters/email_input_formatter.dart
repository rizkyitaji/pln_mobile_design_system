import 'package:flutter/services.dart';

class EmailInputFormatter extends TextInputFormatter {
  final RegExp _allowedCharacters = RegExp(r"[a-z0-9@._%+-]");

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String newText = newValue.text.toLowerCase();
    int selectionIndex = newValue.selection.baseOffset;
    int diff = 0;

    // Filter karakter tidak valid dan cegah double titik
    StringBuffer buffer = StringBuffer();
    for (int i = 0; i < newText.length; i++) {
      String char = newText[i];

      if (char == '.' && i > 0 && newText[i - 1] == '.') {
        if (i < selectionIndex) diff++;
        continue;
      }

      if (_allowedCharacters.hasMatch(char)) {
        buffer.write(char);
      } else {
        if (i < selectionIndex) diff++;
      }
    }

    String result = buffer.toString();

    // Batasi TLD setelah '@'
    int atIndex = result.lastIndexOf('@');
    if (atIndex != -1) {
      String domainPart = result.substring(atIndex + 1);
      int lastDot = domainPart.lastIndexOf('.');

      if (lastDot != -1 && lastDot < domainPart.length - 1) {
        String tld = domainPart.substring(lastDot + 1);

        if (tld.length > 6) {
          int cut = tld.length - 6;
          // Potong TLD saja
          result = result.substring(0, result.length - cut);
          if (selectionIndex > result.length) {
            selectionIndex = result.length;
          }
        }
      }
    }

    return TextEditingValue(
      text: result,
      selection: TextSelection.collapsed(offset: selectionIndex - diff),
    );
  }
}
