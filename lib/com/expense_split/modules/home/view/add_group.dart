import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../base/ui/view/custom_text_form_field.dart';
import '../controller/home_main_controller.dart';

class AddGroup extends StatelessWidget {
  AddGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.groups),
                const SizedBox(
                  width: 30,
                ),
                SizedBox(
                  width: Get.width * 0.7,
                  child: CustomTextFormField(
                    textEditingController: controller.groupNameController,
                    hint: "Enter the group name",
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    outlineInputBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).canvasColor),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.resolveWith<Color?>(
                (Set<WidgetState> states) {
                  if (states.contains(WidgetState.pressed)) {
                    return Theme.of(context).primaryColor.withOpacity(0.8);
                  }
                  return Theme.of(context)
                      .primaryColor; // Use the component's default.
                },
              ),
            ),
            onPressed: () {
              controller.onCreateGroup();
            },
            child: Text(
              "Create Group",
              style: GoogleFonts.lato(color: Colors.white),
            )),
      ),
    );
  }
}
