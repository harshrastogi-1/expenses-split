import 'package:expense_split/com/expense_split/theme/color/color_light.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  primaryColor: ColorLight.primaryColor,
  canvasColor: ColorLight.colorPrimaryLight,
  cardColor: ColorLight.colorPrimaryLight,
  appBarTheme: AppBarTheme(
    backgroundColor: ColorLight.lightTabBackgroundColor,
    iconTheme: IconThemeData(color: ColorLight.lightTextColor),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorLight.lightTabBackgroundColor,
      selectedItemColor: ColorLight.lightTextColor,
      unselectedItemColor: Colors.black),
  hoverColor: ColorLight.lightHoverColor,
  iconTheme: IconThemeData(color: ColorLight.lightTextColor),
);
