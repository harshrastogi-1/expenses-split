import 'package:expense_split/com/expense_split/modules/home/view/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import '../controller/home_main_controller.dart';
import 'activity_page.dart';
import 'friend_page.dart';
import 'home_page.dart';

class ExpensesLandingScreen extends StatelessWidget {
  ExpensesLandingScreen({super.key});

  final HomeController controller = Get.find<HomeController>();

  static final List<Widget> _widgetOptions = <Widget>[
    MyHomePage(),
    FriendPage(),
    ActivityPage(),
    UserProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Obx(() => _widgetOptions.elementAt(controller.selectedIndex.value)),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
            rippleColor: Colors.grey[300]!,
            hoverColor: Colors.grey[100]!,
            gap: 8,
            activeColor: Colors.white,
            iconSize: 24,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: const Duration(milliseconds: 400),
            tabBackgroundColor: Theme.of(context).primaryColor,
            color: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
            tabs: const [
              GButton(icon: LineIcons.home, text: 'Home'),
              GButton(icon: LineIcons.userFriends, text: 'Friends'),
              GButton(icon: Icons.bar_chart, text: 'Activity'),
              GButton(icon: LineIcons.user, text: 'Profile'),
            ],
            selectedIndex: controller.selectedIndex.value,
            onTabChange: (index) {
              controller.selectedIndex.value = index;
            },
          ),
        ),
      ),
    );
  }
}
