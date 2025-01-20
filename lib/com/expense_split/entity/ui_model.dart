// User Entity
import '../model/groups.dart';

class UserEntity {
  final String? userId;
  final String? name;
  final String? email;
  final String? profilePicture;
  final List<String>? friends;
  final List<String>? groups;
  final Map<String, int>? balances;
  final num? owedAmount;

  UserEntity({
    this.userId,
    this.name,
    this.email,
    this.profilePicture,
    this.friends,
    this.groups,
    this.balances,
    this.owedAmount,
  });
}

// Group Entity
class GroupEntity {
  final String? groupId;
  final String? name;
  final String? createdBy;
  final Map<String, GroupMember>? members;
  final List<String>? expenses;
  final Map<String, Map<String, dynamic>>? groupBalances;
  final num? userBalance;

  GroupEntity({
    this.groupId,
    this.name,
    this.createdBy,
    this.members,
    this.expenses,
    this.groupBalances,
    this.userBalance = 0,
  });
}

// Expense Entity
class ExpenseEntity {
  final String groupId;
  final String description;
  final int amount;
  final String paidBy;
  final Map<String, AmountOwed> splitAmong;
  final int timestamp;

  ExpenseEntity({
    required this.groupId,
    required this.description,
    required this.amount,
    required this.paidBy,
    required this.splitAmong,
    required this.timestamp,
  });
}

// Settlement Entity
class SettlementEntity {
  final String fromUserId;
  final String toUserId;
  final int amount;
  final String groupId;
  final int timestamp;

  SettlementEntity({
    required this.fromUserId,
    required this.toUserId,
    required this.amount,
    required this.groupId,
    required this.timestamp,
  });
}
