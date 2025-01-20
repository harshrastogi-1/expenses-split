import 'package:expense_split/com/expense_split/enums/group_type_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class CommonUtils {
  static IconData getGroupType(GroupType groupType) {
    switch (groupType) {
      case GroupType.trip:
        return LineIcons.suitcaseRolling; // Represents travel/luggage
      case GroupType.home:
        return LineIcons.home; // Represents home
      case GroupType.restaurant:
        return LineIcons.utensils; // Represents food/restaurant
      case GroupType.couples:
        return LineIcons.heart; // Represents love/couples
      case GroupType.family:
        return LineIcons.users; // Represents a group of people (family)
      case GroupType.selfExpenses:
        return LineIcons.wallet; // Represents personal expenses
      case GroupType.friends:
        return LineIcons.userFriends;
      default:
        return LineIcons.questionCircle; // Default icon if none match
    }
  }
}
