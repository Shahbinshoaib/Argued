import 'package:argued/ArguedConfigs/color.dart';
import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    // primarySwatch: primaryColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarTheme(),
    // textTheme: textTheme(),
    brightness: Brightness.light,
    // inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

ThemeData darkTheme() {
  return ThemeData();
}

InputDecorationTheme inputDecorationTheme() {
  var outlineInputBorder = OutlineInputBorder(
      gapPadding: 10,
      borderRadius: BorderRadius.circular(32),
      borderSide: BorderSide(color: primaryColor));
  var outlineInputBorderError = OutlineInputBorder(
      gapPadding: 10,
      borderRadius: BorderRadius.circular(32),
      borderSide: BorderSide(color: Colors.redAccent));

  return InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 45, vertical: 20),
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      border: outlineInputBorder,
      errorBorder: outlineInputBorderError);
}

TextTheme textTheme() {
  return TextTheme(
    bodyText2: TextStyle(color: primaryColor),
    bodyText1: TextStyle(color: primaryColor),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
      centerTitle: true,
      color: Colors.white,
      elevation: 0,
      brightness: Brightness.light,
      iconTheme: IconThemeData(color: Colors.black),
      textTheme: TextTheme(
          headline6: TextStyle(color: Color(0xFF888888), fontSize: 20)));
}
