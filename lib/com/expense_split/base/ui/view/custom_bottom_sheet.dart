import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomSheet {
  static Future<void> showBottomSheet(Widget child,
      {double? radius,
      double? bottomRadius,
      bool? isScroll,
      Color? bgColor}) async {
    return Get.bottomSheet(
      child,
      isDismissible: true,
      isScrollControlled: isScroll ?? true,
      backgroundColor: Theme.of(Get.context!).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radius ?? 14),
            topRight: Radius.circular(radius ?? 14),
            bottomRight: Radius.circular(bottomRadius ?? 0),
            bottomLeft: Radius.circular(bottomRadius ?? 0)),
      ),
      enableDrag: true,
    );
  }
}
