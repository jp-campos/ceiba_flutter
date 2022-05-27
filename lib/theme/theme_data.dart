import 'package:flutter/material.dart';
import 'package:prueba_ceiba_flutter/theme/colors.dart';

ThemeData themeData = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: scaffolBackgroundColor,
    accentColor: accentColor,
    focusColor: focusColor,
    iconTheme: IconThemeData(color: accentColor),
    appBarTheme: AppBarTheme(backgroundColor: primaryColor),
    buttonColor: accentColor,
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: primaryColor),
      border: UnderlineInputBorder(
          borderSide: BorderSide(
        color: primaryColor,
      )),
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
        color: primaryColor,
      )),
      focusColor: primaryColor,
    ));
