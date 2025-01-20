import 'package:get/get.dart';

class BaseSuperController extends SuperController {
  // late MoEngageManager moEngageManager;
  // late NetworkManager networkManager;
  // late DeeplinkManager deeplinkController;
  //
  // @override
  // void onInit() {
  //   super.onInit();
  //   if (!Platform.environment.containsKey('FLUTTER_TEST')) {
  //     moEngageManager = Get.find();
  //     networkManager = Get.find();
  //     deeplinkController = Get.find();
  //   }
  // }
  //
  @override
  void onDetached() {}

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() {}

  @override
  void onHidden() {}
}
