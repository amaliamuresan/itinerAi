import 'package:flutter/material.dart';

class DesignColors {
  static const Color introBg1 = Color(0xFFF68210);
  static const Color introBg2 = Color(0xFFF47116);
  static const Color introBg3 = Color(0xFFF2611C);
  static const Color introBg4 = Color(0xFFEE4825);

  static const Color introImageShadowColor1 = Color(0xFFF37016);
  static const Color introImageShadowColor2 = Color(0xFFF2611C);
  static const Color introImageShadowColor3 = Color(0xFFEE4825);
  static const Color introImageShadowColor4 = Color(0xFFE93A15);

  static const Color mainColor = Color(0xFFDC5236);
  static const Color mainRedDark = Color(0xFFEE4527);
  static const Color orangeDark = Color(0xFFF36919);
  static const Color orangeLight = Color(0xFFF9920B);
  static const Color secondaryYellow = Color(0xFFF1C332);
  static const Color starColor = Color(0xFFFBCD02);
  static const Color modalGrey = Color(0xFFE5E5E5);
  static const Color greyLight = Color(0xFFEBEBEB);
  static const Color skeletonContainerHighlightColor = Color(0xFFF0F0F0);
  static const Color greyColorInDetailsPage = Color(0xFF646464);
  static const Color lightGrey = Color(0xFF808080);
  static const Color disabledButton = Color(0xFFBCBCBC);
  static const Color imageGalleryGradient = Color(0xFF090504);
  static const Color grey7 = Color(0xFF171414);
  static const Color grey6 = Color(0xFF2F2B2B);
  static const Color grey5 = Color(0xFF534F4E);
  static const Color grey4 = Color(0xFF767170);
  static const Color grey3 = Color(0xFF9A9493);
  static const Color grey2 = Color(0xFFD4CCCB);
  static const Color grey1 = Color(0xFFF7F1F0);
  static const Color grey0 = Color(0xFFFFFCFB);
  static const List<Color> mainGradientArray = [
    DesignColors.orangeLight,
    DesignColors.mainRedDark,
  ];
  static const Gradient obliqueMainGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: mainGradientArray);
  static const Gradient horizontalMainGradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: mainGradientArray);
}
