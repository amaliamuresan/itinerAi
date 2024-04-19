import 'package:flutter/material.dart';
import 'package:itiner_ai/colors/colors.dart';

class ThemeText {
  static TextStyle get h1 => const TextStyle(
      fontStyle: FontStyle.normal,
      color: Colors.white,
      fontSize: 36,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.05);

  static TextStyle get h2 => const TextStyle(
      fontStyle: FontStyle.normal,
      color: Colors.white,
      fontSize: 24,
      height: 1.1,
      fontWeight: FontWeight.w600,
      letterSpacing: 0);

  static TextStyle get h3 => const TextStyle(
      fontStyle: FontStyle.normal,
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.w500,
      letterSpacing: -0.05);

  static TextStyle get h4Bold => const TextStyle(
      fontStyle: FontStyle.normal,
      color: Colors.white,
      fontSize: 20,
      height: 1,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.05);

  static TextStyle get h4Regular => TextStyle(
      fontStyle: FontStyle.normal,
      color: Colors.black.withOpacity(0.3),
      fontSize: 20,
      height: 1,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.2);

  static TextStyle get bodyLargeRegular => const TextStyle(
      fontStyle: FontStyle.normal,
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.02);

  static TextStyle get bodyLargeMedium => const TextStyle(
      fontStyle: FontStyle.normal,
      color: Colors.white,
      fontSize: 17,
      height: 1.05,
      fontWeight: FontWeight.w500,
      letterSpacing: -0.4);

  static TextStyle get bodyLargeRegularBlack => const TextStyle(
      fontStyle: FontStyle.normal,
      color: DesignColors.grey7,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.02);

  static TextStyle get bodyLargeBold => const TextStyle(
      fontStyle: FontStyle.normal,
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.02);

  static TextStyle get bodyLargeBoldBlack => const TextStyle(
      fontStyle: FontStyle.normal,
      color: DesignColors.grey5,
      fontSize: 17,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.02);

  static TextStyle get bodyMediumRegular => const TextStyle(
      fontStyle: FontStyle.normal,
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.02);

  static TextStyle get bodyMediumBold => const TextStyle(
      fontStyle: FontStyle.normal,
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.02);


  static TextStyle get bodyMediumRegularGrey => const TextStyle(
        fontStyle: FontStyle.normal,
        color: DesignColors.grey3,
        fontSize: 15,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.02,
      );

  static TextStyle get bodySmall => const TextStyle(
      fontStyle: FontStyle.normal,
      color: Colors.black,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.02);

  static TextStyle get bodyLargeRegularUnderlined => const TextStyle(
      decoration: TextDecoration.underline,
      fontStyle: FontStyle.normal,
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.02);

  static TextStyle get headingsH3 => const TextStyle(
      color: Colors.white,
      height: 1,
      fontSize: 24,
      letterSpacing: -1.2,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500);

  static TextStyle get bodyLargeRegularDmSans => const TextStyle(
      color: Colors.white,
      height: 1.3,
      fontSize: 17,
      fontStyle: FontStyle.normal,
      letterSpacing: -0.34,
      fontWeight: FontWeight.w400);

  static TextStyle get bodyLargeRegularDmSansGrey5 => const TextStyle(
      color: DesignColors.grey5,
      fontSize: 17,
      fontStyle: FontStyle.normal,
      letterSpacing: -0.02,
      fontWeight: FontWeight.w400);

  static TextStyle get bodyLargeRegularDmSansGrey0 => const TextStyle(
      color: DesignColors.grey0,
      fontSize: 17,
      fontStyle: FontStyle.normal,
      letterSpacing: -0.02,
      fontWeight: FontWeight.w400);

  static TextStyle get bodyLargeRegularRed => const TextStyle(
      color: DesignColors.mainRedDark,
      height: 1.3,
      fontSize: 17,
      fontStyle: FontStyle.normal,
      letterSpacing: -0.34,
      fontWeight: FontWeight.w400);

  static TextStyle get bodyLargeNarrowed => const TextStyle(
      color: Colors.white,
      height: 1,
      fontSize: 16,
      fontStyle: FontStyle.normal,
      letterSpacing: -0.32,
      fontWeight: FontWeight.w400);

  static TextStyle get bodyLargeUnderlined => const TextStyle(
      decoration: TextDecoration.underline,
      color: Colors.white,
      decorationColor: Colors.white,
      fontStyle: FontStyle.normal,
      height: 1,
      fontSize: 17,
      letterSpacing: -0.34,
      fontWeight: FontWeight.w400);
}
