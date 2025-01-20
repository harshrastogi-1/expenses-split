import 'package:expense_split/com/expense_split/entity/ui_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

import '../controller/home_main_controller.dart';

class FriendPage extends StatelessWidget {
  FriendPage({super.key});

  final HomeController controller = Get.find<HomeController>();

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
                  "Friends",
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
            itemCount: controller.friends.length,
            itemBuilder: (context, index) =>
                itemWidget(controller.friends[index])),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color.fromRGBO(112, 86, 79, 1),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget itemWidget(UserEntity user) {
    return AspectRatio(
      aspectRatio: 40 / 9,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  LineIcons.user,
                  size: 30,
                  color: Theme.of(Get.context!).primaryColor,
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
                    user.name ?? "",
                    style: GoogleFonts.lato(fontSize: 18),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  (user.owedAmount ?? 0) < 0 ? "You Owe" : "Owes You",
                  style: GoogleFonts.lato(fontSize: 12),
                ),
                Text(
                  "₹${user.owedAmount}" // Negative balance = user owes
                  ,
                  style: GoogleFonts.lato(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: ((user.owedAmount ?? 0) < 0)
                          ? Colors.red
                          : Colors.green),
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
