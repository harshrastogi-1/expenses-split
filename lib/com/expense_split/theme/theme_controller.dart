import 'package:expense_split/com/expense_split/theme/dark_theme.dart';
import 'package:expense_split/com/expense_split/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  // RxBool to store theme state (dark or light)
  RxBool isDarkMode = false.obs;

  // Method to toggle between dark and light mode
  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeTheme(isDarkMode.value ? darkTheme : lightTheme);
  }

  // Get the current theme mode
  ThemeMode get theme => isDarkMode.value ? ThemeMode.dark : ThemeMode.light;
}
