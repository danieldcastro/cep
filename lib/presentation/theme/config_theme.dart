import 'package:flutter/material.dart';

import 'app_colors.dart';

class ConfigTheme {
  ConfigTheme._internal();
  factory ConfigTheme.instance() => ConfigTheme._internal();
  static String get appName => 'CEP';
  static ThemeData get themeData => ThemeData();
  static TextTheme get textTheme => TextTheme(
        bodyText1: ConfigTheme.instance().textStyle(
            fontSize: 15,
            fontWeight: FontWeight.normal,
            height: 0,
            letterSpacing: 0.13),
        bodyText2: ConfigTheme.instance().textStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            height: 1.5,
            letterSpacing: 0),
        subtitle1: ConfigTheme.instance().textStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            height: 1,
            letterSpacing: 0.13),
        subtitle2: ConfigTheme.instance().textStyle(
            fontSize: 13,
            fontWeight: FontWeight.normal,
            height: 0,
            letterSpacing: 0.13),
        headline2: ConfigTheme.instance().textStyle(
            fontSize: 60,
            height: 1,
            fontWeight: FontWeight.w500,
            letterSpacing: 0),
        headline5: ConfigTheme.instance().textStyle(
            fontSize: 27,
            height: 1.125,
            fontWeight: FontWeight.w600,
            letterSpacing: 0),
        caption: ConfigTheme.instance().textStyle(
            fontSize: 12,
            height: 1,
            fontWeight: FontWeight.normal,
            letterSpacing: 0),
        overline: ConfigTheme.instance().textStyle(
            fontSize: 10,
            height: 1,
            fontWeight: FontWeight.w500,
            letterSpacing: 0),
      );

  TextStyle textStyle(
      {required double fontSize,
      required FontWeight fontWeight,
      required double letterSpacing,
      required double height}) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: fontSize,
      color: AppColors().normalBlackColor,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      height: height,
    );
  }
}
