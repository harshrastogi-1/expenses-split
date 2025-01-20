import 'dart:convert';

import 'package:expense_split/com/expense_split/page_routes/page_route_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../entity/ui_model.dart';
import '../../../mappers/ui_mapper.dart';
import '../../../model/groups.dart';

class HomeController extends GetxController {
  RxInt selectedIndex = 0.obs;
  String currentUserId = "userId1";
  Map<String, dynamic> data = {};
  Rx<UserEntity> user = UserEntity().obs;
  TextEditingController groupNameController = TextEditingController();

  RxList<ExpenseEntity> userActivities = <ExpenseEntity>[].obs;
  RxList<GroupEntity> groups = <GroupEntity>[].obs;
  RxList<UserEntity> friends = <UserEntity>[].obs;

  @override
  void onInit() async {
    await loadAsset();
    getUserGroups(data, currentUserId);
    getUserFriends(data, currentUserId);
    getUserActivity(data, currentUserId);
    getUserProfile(data, currentUserId);
    super.onInit();
  }

  Future<void> loadAsset() async {
    final String response = await rootBundle.loadString('assets/sample.json');
    data = json.decode(response); // If the JSON file contains data
  }

  Future<void> getUserGroups(
      Map<String, dynamic> jsonData, String currentUserId) async {
    jsonData['Groups']?.forEach((groupId, groupJson) {
      Group group = Group.fromJson(groupJson, groupId);
      if (group.members!.containsKey(currentUserId)) {
        groups.add(EntityMapper.mapToGroupEntity(group, groupId));
      }
    });
  }

  Future<void> getUserActivity(
      Map<String, dynamic> jsonData, String currentUserId) async {
    jsonData['Expenses'].forEach((expenseId, expenseJson) {
      Expense expense = Expense.fromJson(expenseJson, expenseId);
      if (expense.splitAmong.containsKey(currentUserId)) {
        userActivities.add(EntityMapper.mapToExpenseEntity(expense, expenseId));
      }
    });
  }

  Future<void> getUserFriends(
      Map<String, dynamic> jsonData, String currentUserId) async {
    // Get the current user object
    User currentUser =
        User.fromJson(jsonData['Users'][currentUserId], currentUserId);

    // Iterate through the users and check if they are friends
    for (String friendId in currentUser.friends ?? []) {
      User friend = User.fromJson(jsonData['Users'][friendId], friendId);
      friend.owedAmount = currentUser.balances?[friendId] ?? 0.0;

      friends.add(EntityMapper.mapToUserEntity(friend));
    }
  }

  Future<void> getUserProfile(
      Map<String, dynamic> jsonData, String currentUserId) async {
    User currentUser =
        User.fromJson(jsonData['Users'][currentUserId], currentUserId);
    user.value = EntityMapper.mapToUserEntity(currentUser);
  }

  onGroupClick(String groupId) {
    Get.toNamed(PageRouteConstants.groupDetailScreen, arguments: [groupId]);
  }

  onCreateGroup() {
    groups.add(GroupEntity(
      name: groupNameController.text,
      createdBy: currentUserId,
    ));
    Get.back();
  }
}
