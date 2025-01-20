import 'package:expense_split/com/expense_split/modules/group_detail/controller/group_detail_controller.dart';
import 'package:get/get.dart';

class GroupDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GroupDetailController>(() => GroupDetailController());
  }
}
