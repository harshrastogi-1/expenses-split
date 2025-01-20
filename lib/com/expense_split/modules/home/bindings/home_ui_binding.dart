import 'package:get/get.dart';

import '../controller/home_main_controller.dart';

class HomeUiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
