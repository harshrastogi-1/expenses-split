// Mapper Class
import 'package:expense_split/com/expense_split/model/groups.dart';

import '../../../main.dart';
import '../entity/ui_model.dart';

class EntityMapper {
  static UserEntity mapToUserEntity(User user) {
    return UserEntity(
      userId: user.userId,
      name: user.name,
      email: user.email ?? '',
      profilePicture: user.profilePicture ?? '',
      friends: user.friends ?? [],
      groups: user.groups ?? [],
      balances: user.balances ?? {},
      owedAmount: user.owedAmount ?? 0,
    );
  }

  static GroupEntity mapToGroupEntity(Group group, String groupId) {
    return GroupEntity(
      groupId: groupId,
      name: group.name ?? "",
      createdBy: group.members?[group.createdBy]?.userName ?? "",
      members: group.members ?? {},
      expenses: group.expenses ?? [],
      groupBalances: group.groupBalances ?? {},
      userBalance: (group.groupBalances?[currentUserId] ?? {})
          .values
          .fold(0.0, (sum, value) => sum! + value),
    );
  }

  static ExpenseEntity mapToExpenseEntity(Expense expenses, String expenseId) {
    return ExpenseEntity(
      groupId: expenses.groupId ?? '',
      description: expenses.description ?? '',
      amount: expenses.amount ?? 0,
      paidBy: expenses.paidBy ?? '',
      splitAmong: expenses.splitAmong ?? {},
      timestamp: expenses.timestamp ?? 0,
    );
  }

  static SettlementEntity mapToSettlementEntity(Map<String, dynamic> json) {
    return SettlementEntity(
      fromUserId: json['fromUserId'] ?? '',
      toUserId: json['toUserId'] ?? '',
      amount: json['amount'] ?? 0,
      groupId: json['groupId'] ?? '',
      timestamp: json['timestamp'] ?? 0,
    );
  }
}
