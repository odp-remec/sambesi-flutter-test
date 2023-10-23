import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final Color _lightPrimaryColor = Colors.blueGrey.shade50;
  static final Color _lightPrimaryVariantColor = Colors.blueGrey.shade800;
  static final Color _lightOnPrimaryColor = Colors.blueGrey.shade200;
  static const Color _lightTextColorPrimary = Colors.black;
  static const Color _appbarColorLight = Colors.blue;

  static final Color _darkPrimaryColor = Colors.blueGrey.shade900;
  static const Color _darkPrimaryVariantColor = Colors.black;
  static final Color _darkOnPrimaryColor = Colors.blueGrey.shade300;
  static const Color _darkTextColorPrimary = Colors.white;
  static final Color _appbarColorDark = Colors.blueGrey.shade800;

  static const Color _iconColor = Colors.white;

  static const Color _accentcolorDark = Color.fromRGBO(74, 217, 217, 1);

  static final TextStyle _lightHeadingText =
      // ignore: prefer_const_constructors
      TextStyle(
          color: _lightTextColorPrimary,
          fontFamily: "Arial",
          fontWeight: FontWeight.bold);

  // ignore: prefer_const_constructors
  static final TextStyle _lightBodyText = TextStyle(
      color: _lightTextColorPrimary,
      fontFamily: "Arial",
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold,
      fontSize: 16);

  static final TextTheme _lightTextTheme = TextTheme(
    headline1: _lightHeadingText,
    bodyText1: _lightBodyText,
  );

  static final TextStyle _darkHeadingText =
      _lightHeadingText.copyWith(color: _darkTextColorPrimary);

  static final TextStyle _darkBodyText =
      _lightBodyText.copyWith(color: _darkTextColorPrimary);

  static final TextTheme _darkTextTheme = TextTheme(
    headline1: _darkHeadingText,
    bodyText1: _darkBodyText,
  );

  static final ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: _lightPrimaryColor,
      appBarTheme: const AppBarTheme(
          backgroundColor: _appbarColorLight,
          iconTheme: IconThemeData(color: _iconColor)),
      bottomAppBarColor: _appbarColorLight,
      colorScheme: ColorScheme.light(
          primary: _lightPrimaryColor,
          secondary: _accentcolorDark,
          onPrimary: _lightOnPrimaryColor,
          surfaceVariant: _lightPrimaryVariantColor),
      textTheme: _lightTextTheme);

  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: _darkPrimaryColor,
      appBarTheme: AppBarTheme(
          backgroundColor: _appbarColorDark,
          iconTheme: const IconThemeData(color: _iconColor)),
      bottomAppBarColor: _appbarColorDark,
      colorScheme: ColorScheme.dark(
          primary: _darkPrimaryColor,
          secondary: _accentcolorDark,
          onPrimary: _darkOnPrimaryColor,
          surfaceVariant: _darkPrimaryVariantColor),
      textTheme: _darkTextTheme);
}
