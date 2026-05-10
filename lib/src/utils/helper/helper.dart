import 'package:flutter/material.dart';

class AppHelper {
  static void safePop<T extends Object?>(BuildContext context, [T? result]) {
    if (Navigator.canPop(context)) {
      Navigator.pop<T>(context, result);
    }
  }

  static bool emailValidation(String text, {bool fromIdPel = false}) {
    if (fromIdPel) return false;

    const String emailRegExp =
        r"^(?![.-])[a-zA-Z0-9._%+-]{3,}@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*\.[a-zA-Z]{2,}(?<![.-])$";
    return !RegExp(emailRegExp).hasMatch(text);
  }

  static bool nameValidation(String text) {
    const String nameRegExp = r"^[A-Za-z.\s\-'’‘]+$";
    return !RegExp(nameRegExp).hasMatch(text);
  }

  static bool aliasNameValidation(String text) {
    const String aliasNameRegExp = r"^[A-Za-z0-9.\s\-'’‘]+$";
    return !RegExp(aliasNameRegExp).hasMatch(text);
  }
}
