import 'package:flutter/material.dart';

class AppColors {
  //General
  static const Color primaryColor = Color(0xFF027DFC);
  static const Color primaryColorAccent = Color(0xFFCDDEFC);
  static const Color primaryColorDark = Color(0xFF0059B5);

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Colors.transparent;

  static const Color inputColor = Color(0xFFFFFFFF);
  static const Color backgroundColor = Color(0xFFF0F5FA);
  static const Color mainColor = Color(0xFFFF852E);
  static const Color c_24 = Color(0xFF242424);
  static const Color c_66 = Color(0xFF666666);
  static const Color c_f2 = Color(0xFFF2F2F2);
  static const Color c_1b = Color(0xFF1B1B1B);
  static const Color c_a1 = Color(0xFFA1A1A1);
  static const Color c_7a = Color(0xFF7A7F88);
  static const Color c_e0 = Color(0xFFE0E0E0);
  static const Color c_55 = Color(0xFF555555);
  static const Color c_07 = Color(0xFF070707);
  static const Color c_ed = Color(0xFFEDEDED);
  static const Color c_cc = Color(0xFFCCCCCC);
  static const Color c_ee = Color(0xFFEEEEEE);
  static const Color c_65 = Color(0xFF656565);
  static const Color c_ff5 = Color(0xFFFF5252);
  static const Color c_e2 = Color(0xFFE2E2E2);
  static const Color c_af = Color(0xFFAFAFAF);
  static const Color c_e5 = Color(0xFFE5E5E5);

  static const Color danger = Color(0xFFFF4D4D);
  static const Color removeColor = Color(0xFFFF002E);

  static const Color shimmerAnimate = Color(0xFF383838);
  static const Color shimmerAnimateLight = Color(0xFFDFDFDF);

  static const Color shimmerBack = Color(0xFF292929);
  static const Color shimmerBackLight = Color(0xFFFFFFFF);

  static Color getColorByName(String color) {
    switch (color.toUpperCase()) {
      case "BLUE":
        return const Color(0xFF0094FF);
      case "BLACK":
        return const Color(0xFF000000);
      case "PINK":
        return const Color(0xFFFF3C99);
      case "GREEN":
        return const Color(0xFF00FF57);
      case "RED":
        return const Color(0xFFFF002E);
      case "ORANGE":
        return const Color(0xFFFF9C40);
      case "YELLOW":
        return const Color(0xFFFFEC40);
      case "VIOLET":
        return const Color(0xFF9919D6);
      case "WHITE":
        return const Color(0xFFFFFFFF);
      case "GRAY":
        return const Color(0xFF939393);
    }

    return const Color(0xFFFFFFFF);
  }
}
