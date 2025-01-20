import 'package:get/get.dart';

import '../../../theme/theme_controller.dart';

class CommonBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<ThemeController>(ThemeController());
    // Get.put<NetworkManager>(NetworkManager());
    // Get.put<EnvironmentManager>(EnvironmentManager());
    // // Get.put<DownloadFileManager>(DownloadFileManager());
    // Get.put<PackageInfoManager>(PackageInfoManager());
    // Get.put<DeviceInfoManager>(DeviceInfoManager());
    // Get.put<CommunicationManager>(CommunicationManager(
    //   networkManager: Get.find(),
    //   infoManager: Get.find(),
    //   deviceInfoManager: Get.find(),
    // ));
    // Get.put<MoEngageManager>(MoEngageManager(
    //     infoManager: Get.find(), deviceInfoManager: Get.find()));
    // Get.put<CalcDownloadManager>(CalcDownloadManager(
    //     downloadFileManager: DownloadFileManager.instance,
    //     networkManager: Get.find()));
    // Get.put<TestCssDownloadManager>(TestCssDownloadManager(
    //     downloadFileManager: DownloadFileManager.instance,
    //     networkManager: Get.find()));
    // Get.put<FilesDownloadManager>(FilesDownloadManager(
    //     downloadFileManager: DownloadFileManager.instance));
    // Get.put<DeeplinkManager>(DeeplinkManager(
    //     moengageManager: Get.find(), networkManager: Get.find()));
    // Get.put<InAppPurchaseManager>(InAppPurchaseManager(
    //     communicationManager: Get.find(), driftDatabase: Get.find()));
    // Get.put<RazorPayPurchaseManager>(
    //   RazorPayPurchaseManager(
    //     moEngageManager: Get.find(),
    //   ),
    // );
  }
}
