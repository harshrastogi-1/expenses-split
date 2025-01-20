import 'package:flutter/material.dart';

import 'color/color_dark.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: ColorDark.primaryColor,
  cardColor: ColorDark.colorPrimaryDark,
  canvasColor: ColorDark.colorPrimaryDark,
  scaffoldBackgroundColor: ColorDark.colorPrimary,
  appBarTheme: AppBarTheme(
    backgroundColor: ColorDark.darkTabBackgroundColor,
    iconTheme: IconThemeData(color: ColorDark.darkTextColor),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorDark.darkTabBackgroundColor,
      selectedItemColor: ColorDark.darkTextColor,
      unselectedItemColor: Colors.white),
  hoverColor: ColorDark.darkHoverColor,
  iconTheme: IconThemeData(color: ColorDark.darkTextColor),
);
