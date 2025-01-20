import 'package:expense_split/com/expense_split/modules/group_detail/bindings/group_detail_binding.dart';
import 'package:expense_split/com/expense_split/modules/group_detail/view/add_expenses.dart';
import 'package:expense_split/com/expense_split/modules/group_detail/view/group_detail_view.dart';
import 'package:expense_split/com/expense_split/modules/home/view/add_group.dart';
import 'package:expense_split/com/expense_split/page_routes/page_route_constants.dart';
import 'package:get/get.dart';

import '../modules/home/bindings/home_ui_binding.dart';
import '../modules/home/view/expenses_landing_screen.dart';

class StorePageRoutes {
  static List<GetPage> mainRouteList = [
    GetPage(
        name: PageRouteConstants.homeScreen,
        page: () => ExpensesLandingScreen(),
        // transition: Transition.cupertino,
        bindings: [HomeUiBinding()]),
    GetPage(
        name: PageRouteConstants.addGroupScreen,
        page: () => AddGroup(),
        // transition: Transition.cupertino,
        bindings: [HomeUiBinding()]),
    GetPage(
        name: PageRouteConstants.groupDetailScreen,
        page: () => GroupDetailView(),
        // transition: Transition.cupertino,
        bindings: [GroupDetailBinding()]),
    GetPage(
        name: PageRouteConstants.addExpensesScreen,
        page: () => AddExpenses(),
        // transition: Transition.cupertino,
        bindings: [GroupDetailBinding()]),
  ];
}
