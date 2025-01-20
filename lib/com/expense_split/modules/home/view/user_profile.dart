import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

import '../../../theme/theme_controller.dart';
import '../controller/home_main_controller.dart';

class UserProfile extends StatelessWidget {
  UserProfile({super.key});
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
                  "Profile",
                  style: GoogleFonts.merriweather(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).primaryColor),
                ),
              ),
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Theme.of(Get.context!).canvasColor,
                    child: Icon(
                      LineIcons.user,
                      size: 40,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.user.value.name ?? "",
                          style: GoogleFonts.lato(fontSize: 18),
                        ),
                        Text(
                          controller.user.value.email ?? "",
                          style: GoogleFonts.lato(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.edit)
                ],
              ),
              Divider(
                height: 40,
              ),
              Text("Feedback"),
              ListTile(
                leading: Icon(Icons.star_rate),
                title: Text("Rate Expenses Split"),
              ),
              ListTile(
                leading: Icon(Icons.contact_support),
                title: Text("Contact Us"),
              ),
              Divider(
                height: 40,
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("Logout"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// title: Row(
// children: [
// CircleAvatar(
// radius: 25,
// ),
// SizedBox(
// width: 10,
// ),
// Column(
// mainAxisSize: MainAxisSize.min,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// "User Name",
// style: GoogleFonts.lato(fontSize: 12),
// ),
// Text(
// "Email/ Number",
// style: GoogleFonts.lato(fontSize: 8),
// ),
// ],
// ),
// Spacer(),
// Icon(Icons.edit)
// ],
// ),
