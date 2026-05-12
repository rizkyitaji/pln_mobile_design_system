import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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

  static Future<void> openUrl(String? url) async {
    if (url == null) return;
    try {
      var uri = Uri.parse(formatSafeDeeplink(url));
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        debugPrint('[WEBVIEW][ERROR]: Terjadi Kesalahan');
      }
    } catch (e) {
      debugPrint('[WEBVIEW][ERROR]: ${e.toString()}');
    }
  }

  static String formatSafeDeeplink(String fullDeeplink) {
    final Uri uri = Uri.parse(fullDeeplink);

    debugPrint('[WEBVIEW][DEEPLINK]: $fullDeeplink');

    if (uri.scheme == 'plnmobile' && uri.host == 'general-in-app-webview') {
      final queryParams = Map<String, String>.from(uri.queryParameters);

      const reservedKeys = {
        'app_bar',
        'can_pop',
        'title',
        'event',
        'token',
        'id',
        'email',
        'name',
        'phone',
        'device_id',
        'latitude',
        'longitude',
        'headers',
        'launch',
      };

      String rawUrlValue = "";
      if (fullDeeplink.contains("url=")) {
        rawUrlValue = fullDeeplink.substring(fullDeeplink.indexOf("url=") + 4);

        for (var key in reservedKeys) {
          if (rawUrlValue.contains("&$key=")) {
            rawUrlValue = rawUrlValue.split("&$key=")[0];
          }
        }
      }

      final result = Uri(
        scheme: uri.scheme,
        host: uri.host,
        queryParameters: {
          'url': rawUrlValue,
          ...queryParams..removeWhere((key, value) {
            if (key == 'url') return true;
            return !reservedKeys.contains(key);
          }),
        },
      );

      debugPrint('[WEBVIEW][DEEPLINK][SAFE]: ${result.toString()}');

      return result.toString();
    }

    return fullDeeplink;
  }
}
