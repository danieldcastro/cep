import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'config_theme.dart';

class AppTheme {
  AppTheme._internal();
  factory AppTheme.instance() => AppTheme._internal();

  static String get appName => ConfigTheme.appName;
  static ThemeData get theme => ThemeData(
        primaryColor: AppColors().primaryColor,
        backgroundColor: AppColors().normalWhiteColor,
        primarySwatch: AppColors().primarySwatch,
        textTheme: ConfigTheme.textTheme,
        scaffoldBackgroundColor: AppColors().normalWhiteColor,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: AppColors().primaryColor),
      );
}
