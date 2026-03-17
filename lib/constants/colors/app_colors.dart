import 'package:flutter/material.dart';

import 'app_palette.dart';

/// Define semantic tokens from [AppPalette]
class AppColors {
  static const Color white = AppPalette.white;
  static const Color black = AppPalette.black;
  static const Color transparent = Colors.transparent;

  // --- BACKGROUND ---
  static const Color background = AppPalette.slate50;
  static const Color backgroundSecondary = AppPalette.slate100;

  // --- PRIMARY ---
  static const Color primary = AppPalette.teal500;
  static const Color primaryPressed = AppPalette.teal600;
  static const Color primarySubtle = AppPalette.teal50;
  static const Color primarySubtlePressed = AppPalette.teal100;

  // --- SECONDARY ---
  static const Color secondary = AppPalette.sky500;
  static const Color secondaryPressed = AppPalette.sky600;
  static const Color secondarySubtle = AppPalette.sky50;
  static const Color secondarySubtlePressed = AppPalette.sky100;

  // --- TERTIARY ---
  static const Color tertiary = AppPalette.lemon500;
  static const Color tertiaryPressed = AppPalette.lemon600;
  static const Color tertiarySubtle = AppPalette.lemon50;
  static const Color tertiarySubtlePressed = AppPalette.lemon100;

  // --- ERROR ---
  static const Color error = AppPalette.red500;
  static const Color errorPressed = AppPalette.red600;
  static const Color errorSubtle = AppPalette.red50;
  static const Color errorSubtlePressed = AppPalette.red100;

  // --- SUCCESS ---
  static const Color success = AppPalette.green500;
  static const Color successPressed = AppPalette.green600;
  static const Color successSubtle = AppPalette.green50;
  static const Color successSubtlePressed = AppPalette.green100;

  // --- WARNING ---
  static const Color warning = AppPalette.yellow500;
  static const Color warningPressed = AppPalette.yellow600;
  static const Color warningSubtle = AppPalette.yellow50;
  static const Color warningSubtlePressed = AppPalette.yellow100;

  // --- DISABLED ---
  static const Color disabled = AppPalette.slate100;

  // --------------------------------------------- FONT COLORS ---------------------------------------------

  // --- FONT COLORS DEFAULT ---
  static const Color textHeading = AppPalette.slate950;
  static const Color textBody = AppPalette.slate800;
  static final Color textCaption = AppPalette.slate800.withValues(alpha: 0.75);
  static const Color textPlaceholder = AppPalette.slate500;

  // --- FONT COLORS ON-COLOR ---
  static const Color textOnColorHeading = AppPalette.slate50;
  static final Color textOnColorBody = AppPalette.slate50.withValues(
    alpha: 0.75,
  );
  static final Color textOnColorCaption = AppPalette.slate50.withValues(
    alpha: 0.75,
  );
  static final Color textOnColorPlaceholder = AppPalette.slate50.withValues(
    alpha: 0.50,
  );

  // --- FONT COLORS PRIMARY ---
  static const Color textPrimary = AppPalette.teal700;
  static const Color textPrimaryPressed = AppPalette.teal800;
  static const Color textOnPrimary = AppPalette.teal100;
  static const Color textOnPrimaryPressed = AppPalette.teal200;

  // --- FONT COLORS ERROR ---
  static const Color textError = AppPalette.red700;
  static const Color textErrorPressed = AppPalette.red800;
  static const Color textOnError = AppPalette.red100;
  static const Color textOnErrorPressed = AppPalette.red200;

  // --- FONT COLORS INFORMATION ---
  static const Color textInfo = AppPalette.sky700;
  static const Color textInfoPressed = AppPalette.sky800;
  static const Color textOnInfo = AppPalette.sky100;
  static const Color textOnInfoPressed = AppPalette.sky200;

  // --- FONT COLORS SUCCESS ---
  static const Color textSuccess = AppPalette.green800;
  static const Color textSuccessPressed = AppPalette.green900;
  static const Color textOnSuccess = AppPalette.green100;
  static const Color textOnSuccessPressed = AppPalette.green200;

  // --- FONT COLORS WARNING ---
  static const Color textWarning = AppPalette.yellow700;
  static const Color textWarningPressed = AppPalette.yellow800;
  static const Color textOnWarning = AppPalette.yellow100;
  static const Color textOnWarningPressed = AppPalette.yellow200;

  // --- FONT COLORS DISABLED ---
  static const Color textDisabled = AppPalette.slate500;
  static const Color textOnDisabled = AppPalette.slate200;

  // --------------------------------------------- ICON COLORS ---------------------------------------------

  // --- ICON DEFAULT ---
  static const Color icon = AppPalette.slate950;
  static const Color iconOnColor = AppPalette.slate50;

  // --- ICON PRIMARY ---
  static const Color iconPrimary = AppPalette.teal700;
  static const Color iconPrimaryPressed = AppPalette.teal800;
  static const Color iconOnPrimary = AppPalette.teal100;
  static const Color iconOnPrimaryPressed = AppPalette.teal200;

  // --- ICON ERROR ---
  static const Color iconError = AppPalette.red700;
  static const Color iconErrorPressed = AppPalette.red800;
  static const Color iconOnError = AppPalette.red100;
  static const Color iconOnErrorPressed = AppPalette.red200;

  // --- ICON INFORMATION ---
  static const Color iconInfo = AppPalette.sky700;
  static const Color iconInfoPressed = AppPalette.sky800;
  static const Color iconOnInfo = AppPalette.sky100;
  static const Color iconOnInfoPressed = AppPalette.sky200;

  // --- ICON SUCCESS ---
  static const Color iconSuccess = AppPalette.green800;
  static const Color iconSuccessPressed = AppPalette.green900;
  static const Color iconOnSuccess = AppPalette.green100;
  static const Color iconOnSuccessPressed = AppPalette.green200;

  // --- ICON YELLOW (Warning) ---
  static const Color iconYellow = AppPalette.yellow600;
  static const Color iconYellowPressed = AppPalette.yellow700;
  static const Color iconOnYellow = AppPalette.yellow100;
  static const Color iconOnYellowPressed = AppPalette.yellow200;

  // --- ICON DISABLED ---
  static const Color iconDisabled = AppPalette.slate500;
  static const Color iconOnDisabled = AppPalette.slate200;

  // --------------------------------------------- BORDER COLORS ---------------------------------------------

  // --- BORDER DEFAULT ---
  static const Color border = AppPalette.slate200;
  static const Color borderOnColor = AppPalette.slate200;
  static final Color borderOnColorAlpha = AppPalette.slate50.withValues(
    alpha: 0.20,
  );

  // --- BORDER PRIMARY ---
  static const Color borderPrimary = AppPalette.teal700;
  static const Color borderPrimaryPressed = AppPalette.teal800;
  static const Color borderPrimarySubtle = AppPalette.teal50;
  static const Color borderPrimarySubtlePressed = AppPalette.teal100;

  // --- BORDER PRIMARY ON-COLOR ---
  static final Color borderOnColorPrimary = AppPalette.teal700.withValues(
    alpha: 0.75,
  );
  static final Color borderOnColorPrimaryPressed = AppPalette.teal800
      .withValues(alpha: 0.75);
  static final Color borderOnColorPrimarySubtle = AppPalette.teal50.withValues(
    alpha: 0.75,
  );
  static final Color borderOnColorPrimarySubtlePressed = AppPalette.teal100
      .withValues(alpha: 0.75);

  // --- BORDER ERROR ---
  static const Color borderError = AppPalette.red500;
  static const Color borderErrorPressed = AppPalette.red600;
  static const Color borderErrorSubtle = AppPalette.red50;
  static const Color borderErrorSubtlePressed = AppPalette.red100;

  // --- BORDER INFORMATION ---
  static const Color borderInfo = AppPalette.sky500;
  static const Color borderInfoPressed = AppPalette.sky600;
  static const Color borderInfoSubtle = AppPalette.sky50;
  static const Color borderInfoSubtlePressed = AppPalette.sky100;

  // --- BORDER SUCCESS ---
  static const Color borderSuccess = AppPalette.green500;
  static const Color borderSuccessPressed = AppPalette.green600;
  static const Color borderSuccessSubtle = AppPalette.green50;
  static const Color borderSuccessSubtlePressed = AppPalette.green100;

  // --- BORDER YELLOW (Warning) ---
  static const Color borderYellow = AppPalette.yellow500;
  static const Color borderYellowPressed = AppPalette.yellow600;
  static const Color borderYellowSubtle = AppPalette.yellow50;
  static const Color borderYellowSubtlePressed = AppPalette.yellow100;

  // --- BORDER DISABLED ---
  static const Color borderDisabled = AppPalette.slate200;

  // --------------------------------------------- GRADIENT COLORS ---------------------------------------------

  static const LinearGradient linearGradient = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [AppPalette.teal500, AppPalette.lemon200],
  );
}
