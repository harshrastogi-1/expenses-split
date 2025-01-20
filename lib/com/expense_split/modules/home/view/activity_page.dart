import 'package:expense_split/com/expense_split/entity/ui_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/theme_controller.dart';
import '../controller/home_main_controller.dart';

class ActivityPage extends StatelessWidget {
  ActivityPage({super.key});
  final HomeController controller = Get.find<HomeController>();
  final ThemeController themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
              expandedHeight: 80.0,
              floating: false,
              pinned: true,
              leadingWidth: 0, // Removes leading space
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: const EdgeInsets.only(left: 16, bottom: 5),
                title: Text(
                  "Activities",
                  style: GoogleFonts.merriweather(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).primaryColor),
                ),
              ),
            ),
          ];
        },
        body: ListView.builder(
            itemCount: controller.userActivities.length,
            itemBuilder: (context, index) =>
                itemWidget(controller.userActivities[index])),
      ),
    );
  }

  Widget itemWidget(ExpenseEntity expense) {
    return AspectRatio(
      aspectRatio: 35 / 9,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
            color: Theme.of(Get.context!).canvasColor,
            borderRadius: BorderRadius.circular(30)),
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1 / 1,
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(Get.context!).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    expense.paidBy,
                    style: GoogleFonts.lato(fontSize: 18),
                  ),
                  Text(
                    "Description Details of the user activity can be defined here ",
                    style: GoogleFonts.lato(fontSize: 12),
                    maxLines: 1,
                  ),
                  const Spacer(),
                  Text(
                    "22/11/2025",
                    style: GoogleFonts.lato(fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
