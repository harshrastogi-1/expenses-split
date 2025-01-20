import 'package:expense_split/com/expense_split/modules/home/controller/home_main_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../main.dart';
import '../../../entity/ui_model.dart';
import '../../../mappers/ui_mapper.dart';
import '../../../model/groups.dart';

class GroupDetailController extends GetxController {
  late String groupId;
  Rx<GroupEntity> selectedGroupModel = GroupEntity().obs;
  TextEditingController descController = TextEditingController();
  TextEditingController expenseController = TextEditingController();

  RxList<ExpenseEntity> expensesList = <ExpenseEntity>[].obs;
  Rx<double> totalAmount = 0.0.obs;
  Rx<double> totalAmountOwed = 0.0.obs;
  Rx<double> totalAmountReceivable = 0.0.obs;
  Rx<double> totalPaymentsMade = 0.0.obs;

  RxBool isExpanded = true.obs;

  Map<String, dynamic> data = Get.find<HomeController>().data;

  @override
  void onInit() {
    groupId = Get.arguments[0];
    getGroupDetails(data, groupId);
    getExpensesInGroup(data, groupId);
    super.onInit();
  }

  Future<void> getGroupDetails(
      Map<String, dynamic> jsonData, String groupId) async {
    // Search for the group using groupId
    final groupJson = jsonData['Groups'][groupId];
    if (groupJson != null) {
      Group group = Group.fromJson(groupJson, groupId);
      selectedGroupModel.value = EntityMapper.mapToGroupEntity(group, groupId);
      // Assuming your Group model has fromJson constructor
    } else {
      throw Exception("Group not found");
    }
  }

  Future<void> getExpensesInGroup(
      Map<String, dynamic> jsonData, String groupId) async {
    if (jsonData['Groups'][groupId]['expenses'] != null) {
      List<String> expenseIds =
          List<String>.from(jsonData['Groups'][groupId]['expenses']);

      for (String expenseId in expenseIds) {
        Expense expenses =
            Expense.fromJson(jsonData["Expenses"][expenseId], expenseId);
        ExpenseEntity expenseEntity =
            EntityMapper.mapToExpenseEntity(expenses, expenseId);

        expensesList.add(expenseEntity);
      }

      totalAmount.value = getTotalPaymentMade(expensesList);
      totalPaymentsMade.value = getCurrentUserPayment(expensesList);
      totalAmountReceivable.value =
          getCurrentUserReceives(selectedGroupModel.value);
      totalAmountOwed.value = getCurrentUserOwes(selectedGroupModel.value);
    }
  }

// Function to calculate the total payment made by all users in the group
  double getTotalPaymentMade(List<ExpenseEntity> expenses) {
    double totalPayment = 0.0;
    for (var expense in expenses) {
      totalPayment += expense.amount; // Sum all expenses
    }
    return totalPayment;
  }

// Function to calculate the total payment made by the current user
  double getCurrentUserPayment(List<ExpenseEntity> expenses) {
    double currentUserPayment = 0.0;
    for (var expense in expenses) {
      // If the current user paid this expense, add the amount to their total payment
      if (expense.paidBy == currentUserId) {
        currentUserPayment += expense.amount;
      }
    }
    return currentUserPayment;
  }

// Function to calculate how much the current user owes to others
  double getCurrentUserOwes(GroupEntity group) {
    double totalOwed = 0.0;
    var userBalances = group.groupBalances?[currentUserId];

    if (userBalances != null) {
      userBalances.forEach((friendId, amount) {
        if (amount < 0) {
          totalOwed +=
              -amount; // Add up the negative amounts (amount the current user owes)
        }
      });
    }
    return totalOwed;
  }

// Function to calculate how much the current user should receive from others
  double getCurrentUserReceives(GroupEntity group) {
    double totalReceived = 0.0;
    var userBalances = group.groupBalances?[currentUserId];

    if (userBalances != null) {
      userBalances.forEach((friendId, amount) {
        if (amount > 0) {
          totalReceived +=
              amount; // Add up the positive amounts (amount others owe the current user)
        }
      });
    }
    return totalReceived;
  }

  void settlePayment() {
    totalAmountOwed.value = 0;
  }

  void addExpense() {
    Map<String, AmountOwed> splitAmong = {
      "userId1": AmountOwed(
          amountOwed: int.parse(expenseController.text) ~/
              selectedGroupModel.value.members!.length)
    };
    expensesList.add(ExpenseEntity(
        groupId: groupId,
        description: descController.text,
        amount: int.parse(expenseController.text),
        paidBy: currentUserId,
        splitAmong: splitAmong,
        timestamp: DateTime.now().millisecondsSinceEpoch));
    Get.back();
  }

  void updateGroupDetails() {
    Get.back();
  }
}
