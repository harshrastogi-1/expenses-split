// User Model Class
class User {
  final String? userId;
  final String? name;
  final String? email;
  final String? profilePicture;
  final List<String>? friends;
  final List<String>? groups;
  final Map<String, int>? balances;
  num? owedAmount;

  User({
    this.userId,
    this.name,
    this.email,
    this.profilePicture,
    this.friends,
    this.groups,
    this.balances,
    this.owedAmount,
  });

  // fromJson Method
  factory User.fromJson(Map<String, dynamic> json, String userId) {
    return User(
        userId: userId,
        name: json['name'],
        email: json['email'],
        profilePicture: json['profilePicture'],
        friends: List<String>.from(json['friends']),
        groups: List<String>.from(json['groups']),
        balances: Map<String, int>.from(json['balances'] ?? {}),
        owedAmount: json["owedAmount"] ?? 0);
  }

  // toJson Method
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      'profilePicture': profilePicture,
      'friends': friends,
      'groups': groups,
      'balances': balances,
      'owedAmount': owedAmount,
    };
  }
}

// Group Model Class
class Group {
  final String? groupId;
  final String? name;
  final String? createdBy;
  final Map<String, GroupMember>? members;
  final List<String>? expenses;
  final Map<String, Map<String, dynamic>>? groupBalances;

  Group({
    this.groupId,
    this.name,
    this.createdBy,
    this.members,
    this.expenses,
    this.groupBalances,
  });

  // fromJson Method
  factory Group.fromJson(Map<String, dynamic> json, String groupId) {
    var membersMap = <String, GroupMember>{};
    json['members'].forEach((key, value) {
      membersMap[key] = GroupMember.fromJson(value);
    });

    return Group(
      groupId: groupId,
      name: json['name'],
      createdBy: json['createdBy'],
      members: membersMap,
      expenses: List<String>.from(json['expenses']),
      groupBalances:
          Map<String, Map<String, dynamic>>.from(json['groupBalances']),
    );
  }

  // toJson Method
  Map<String, dynamic> toJson() {
    var membersMap = <String, Map<String, dynamic>>{};
    members?.forEach((key, value) {
      membersMap[key] = value.toJson();
    });

    return {
      'groupId': groupId,
      'name': name,
      'createdBy': createdBy,
      'members': membersMap,
      'expenses': expenses,
      'groupBalances': groupBalances,
    };
  }
}

// GroupMember Model Class
class GroupMember {
  final String userName;
  final int shareAmount;

  GroupMember({
    required this.userName,
    required this.shareAmount,
  });

  // fromJson Method
  factory GroupMember.fromJson(Map<String, dynamic> json) {
    return GroupMember(
      userName: json['userName'],
      shareAmount: json['shareAmount'],
    );
  }

  // toJson Method
  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'shareAmount': shareAmount,
    };
  }
}

// Expense Model Class
class Expense {
  final String groupId;
  final String description;
  final int amount;
  final String paidBy;
  final Map<String, AmountOwed> splitAmong;
  final int timestamp;

  Expense({
    required this.groupId,
    required this.description,
    required this.amount,
    required this.paidBy,
    required this.splitAmong,
    required this.timestamp,
  });

  // fromJson Method
  factory Expense.fromJson(Map<String, dynamic> json, String expenseId) {
    var splitMap = <String, AmountOwed>{};
    json['splitAmong'].forEach((key, value) {
      splitMap[key] = AmountOwed.fromJson(value);
    });

    return Expense(
      groupId: json['groupId'],
      description: json['description'],
      amount: json['amount'],
      paidBy: json['paidBy'],
      splitAmong: splitMap,
      timestamp: json['timestamp'],
    );
  }

  // toJson Method
  Map<String, dynamic> toJson() {
    var splitMap = <String, Map<String, dynamic>>{};
    splitAmong.forEach((key, value) {
      splitMap[key] = value.toJson();
    });

    return {
      'groupId': groupId,
      'description': description,
      'amount': amount,
      'paidBy': paidBy,
      'splitAmong': splitMap,
      'timestamp': timestamp,
    };
  }
}

// AmountOwed Model Class
class AmountOwed {
  final int amountOwed;

  AmountOwed({
    required this.amountOwed,
  });

  // fromJson Method
  factory AmountOwed.fromJson(Map<String, dynamic> json) {
    return AmountOwed(
      amountOwed: json['amountOwed'],
    );
  }

  // toJson Method
  Map<String, dynamic> toJson() {
    return {
      'amountOwed': amountOwed,
    };
  }
}

// Settlement Model Class
class Settlement {
  final String fromUserId;
  final String toUserId;
  final int amount;
  final String groupId;
  final int timestamp;

  Settlement({
    required this.fromUserId,
    required this.toUserId,
    required this.amount,
    required this.groupId,
    required this.timestamp,
  });

  // fromJson Method
  factory Settlement.fromJson(Map<String, dynamic> json) {
    return Settlement(
      fromUserId: json['fromUserId'],
      toUserId: json['toUserId'],
      amount: json['amount'],
      groupId: json['groupId'],
      timestamp: json['timestamp'],
    );
  }

  // toJson Method
  Map<String, dynamic> toJson() {
    return {
      'fromUserId': fromUserId,
      'toUserId': toUserId,
      'amount': amount,
      'groupId': groupId,
      'timestamp': timestamp,
    };
  }
}
