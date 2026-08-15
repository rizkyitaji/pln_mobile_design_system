import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';
import 'package:url_launcher/url_launcher.dart';

class AppHelper {
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

  static void zoomImage(BuildContext context, {String? url}) async {
    if (url != null) {
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          contentPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          content: GestureDetector(
            onTap: () => context.safePop(),
            child: AppNetworkImage(
              url: url,
              height: AppSizes.s156.scaleWidth,
              borderRadius: AppRadius.rounded8,
              backgroundColor: AppColors.transparent,
              margin: EdgeInsets.symmetric(horizontal: AppSizes.s16),
            ),
          ),
        ),
      );
    }
  }

  static String getOperatorIcon(String? operator) {
    switch ((operator ?? '').toLowerCase()) {
      case 'pln':
        return AppAssets.iconPln;
      case 'charge+':
        return AppAssets.iconChargePlus;
      case 'bluecharge':
        return AppAssets.iconBlueCharge;
      case 'voltron':
        return AppAssets.iconVoltron;
      case 'hyundai':
        return AppAssets.iconHyundai;
      case 'indomobil':
        return AppAssets.iconIndomobil;
      case 'dayagreen':
        return AppAssets.iconDayaGreen;
      case 'lexus':
        return AppAssets.iconLexus;
      case 'parking+':
        return AppAssets.iconParkingPlus;
      case 'astra':
        return AppAssets.iconAstra;
      case 'terra charge':
        return AppAssets.iconTerraCharge;
      case 'toyota':
        return AppAssets.iconToyota;
      case 'starvo':
        return AppAssets.iconStarvo;
      case 'hvt':
        return AppAssets.iconHvt;
      case 'wuling':
        return AppAssets.iconWuling;
      case 'igreen+':
        return AppAssets.iconIGreenPlus;
      case 'cazgo':
        return AppAssets.iconCazgo;
      default:
        return AppAssets.iconMenuSpklu;
    }
  }

  static double getPercent(double value, double total) {
    double progress = value / (total == 0 ? 1 : total);
    double percent = progress * 100;
    return percent;
  }

  static double toDouble(dynamic value) {
    if (value == null) {
      return 0;
    } else if (value is num) {
      return value.toDouble();
    } else if (value is String) {
      final str = value.trim();
      if (str.isEmpty || str == 'null' || str == '-') {
        return 0;
      }
      return double.tryParse(str) ?? 0;
    } else {
      return 0;
    }
  }

  static int toInt(dynamic value) {
    if (value == null) {
      return 0;
    } else if (value is num) {
      return value.toInt();
    } else if (value is String) {
      final str = value.trim().replaceAll(',', '.');
      if (str.isEmpty || str == 'null' || str == '-') {
        return 0;
      }
      final parsedDouble = double.tryParse(str);
      if (parsedDouble != null) {
        return parsedDouble.toInt();
      }
      return 0;
    } else {
      return 0;
    }
  }

  static String getConnectorIcon(String? connector) {
    connector ??= '';
    if (connector.contains('Stop Kontak')) {
      return AppAssets.iconPowerSocketOutlined;
    } else if (connector.contains('CCS2')) {
      return AppAssets.iconConnectorCcs2;
    } else if (connector.contains('CHADEMO')) {
      return AppAssets.iconConnectorChademo;
    } else {
      return AppAssets.iconConnectorAc;
    }
  }

  static void copyText({String? text, String? label}) {
    Clipboard.setData(ClipboardData(text: text ?? ''));
    AppSnackBar.show(
      msg: '$label berhasil disalin',
      position: AppSnackBarPosition.top,
      type: AppSnackBarType.success,
      height: kToolbarHeight,
    );
  }

  static void nextFocus(
    BuildContext context,
    FocusNode currentFocus,
    FocusNode nextFocus,
  ) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
