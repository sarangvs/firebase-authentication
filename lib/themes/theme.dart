import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: AppTheme.secondaryColor,
  primaryColor: AppTheme.primaryColor,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(AppTheme.redColor),
    ),
  ),
);

class AppTheme {
  static const primaryColor = Color(0xff008080);
  static const formFieldColor = Color(0xffF9F9F9);
  static const redColor = Color(0xffEB5757);
  static const secondaryColor = Color(0xffffffff);
  static const textColor = Color(0xff828282);
  static const lightFontColor = Color(0xffAEAEAE);
}
