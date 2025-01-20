import 'package:expense_split/com/expense_split/entity/ui_model.dart';
import 'package:expense_split/com/expense_split/page_routes/page_route_constants.dart';
import 'package:expense_split/com/expense_split/theme/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../base/data/helper/common_utils.dart';
import '../../../enums/group_type_enum.dart';
import '../controller/home_main_controller.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
              expandedHeight: 70.0,
              floating: false,
              pinned: true,
              leadingWidth: 0, // Removes leading space
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: const EdgeInsets.only(
                  left: 16,
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Expenses Split",
                      style: GoogleFonts.merriweather(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).primaryColor),
                    ),
                    Obx(
                      () => IconButton(
                          onPressed: () {
                            themeController.toggleTheme();
                          },
                          icon: themeController.isDarkMode.value
                              ? const Icon(Icons.dark_mode_sharp)
                              : const Icon(Icons.light_mode_sharp)),
                    )
                  ],
                ),
              ),
            ),
          ];
        },
        body: Obx(
          () => controller.groups.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ))
              : ListView.builder(
                  itemCount: controller.groups.length,
                  itemBuilder: (context, index) {
                    return itemWidget(controller.groups[index]);
                  }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(PageRouteConstants.addGroupScreen);
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget itemWidget(GroupEntity groupData) {
    return AspectRatio(
      aspectRatio: 30 / 9,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.circular(30)),
        child: InkWell(
          onTap: () {
            controller.onGroupClick(groupData.groupId!);
          },
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 1 / 1,
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Icon(
                    CommonUtils.getGroupType(GroupType.trip),
                    size: 45,
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      groupData.name ?? "",
                      style: GoogleFonts.lato(fontSize: 18),
                    ),
                    Text(
                      "Created By : ${groupData.createdBy}",
                      style: GoogleFonts.lato(fontSize: 12),
                    ),
                    // const Spacer(),
                    // Text(
                    //   "Total amount you owe - ${0}\$ ",
                    //   style: GoogleFonts.lato(fontSize: 12),
                    // ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    (groupData.userBalance ?? 0) < 0
                        ? "You owe" // Negative balance = user owes
                        : "Owes You",
                    style: GoogleFonts.lato(fontSize: 12),
                  ),
                  Text(
                    (groupData.userBalance ?? 0) < 0
                        ? "₹${-groupData.userBalance!}" // Negative balance = user owes
                        : "₹${groupData.userBalance!}",
                    style: GoogleFonts.lato(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: (groupData.userBalance ?? 0) < 0
                            ? Colors.red
                            : Colors.green),
                  ),
                ],
              ),
              const SizedBox(
                width: 8,
              )
            ],
          ),
        ),
      ),
    );
  }
}
