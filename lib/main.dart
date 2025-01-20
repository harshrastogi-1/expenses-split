import 'dart:async';

import 'package:expense_split/com/expense_split/theme/dark_theme.dart';
import 'package:expense_split/com/expense_split/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'com/expense_split/logger/log_manager.dart';
import 'com/expense_split/page_routes/page_route_constants.dart';
import 'com/expense_split/page_routes/store_page_routes.dart';
import 'com/expense_split/theme/theme_controller.dart';

String currentUserId = "userId1";

void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await ScreenUtil.ensureScreenSize();
    runApp(MyApp());
  }, (error, stack) => Log.logData(error.toString(), logType: LogType.error));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final ThemeController themeController =
      Get.put<ThemeController>(ThemeController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => GetMaterialApp(
        title: 'Expenses Split',
        themeMode: themeController.theme, // Get the theme mode reactively
        darkTheme: darkTheme,
        theme: lightTheme,
        // initialBinding: CommonBindings(),
        getPages: StorePageRoutes.mainRouteList,
        initialRoute: PageRouteConstants.homeScreen,
        debugShowCheckedModeBanner: false,
        // home: const MyHomePage(),
      ),
    );
  }
}
