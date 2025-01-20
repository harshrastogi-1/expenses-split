import 'package:expense_split/com/expense_split/base/ui/view/custom_bottom_sheet.dart';
import 'package:expense_split/com/expense_split/base/ui/view/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/group_detail_controller.dart';

class AddExpenses extends StatelessWidget {
  AddExpenses({super.key});
  final GroupDetailController controller = Get.find<GroupDetailController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          "Add Expenses in ",
          style: GoogleFonts.merriweather(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).primaryColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.description),
                const SizedBox(
                  width: 30,
                ),
                SizedBox(
                  width: Get.width * 0.7,
                  child: CustomTextFormField(
                    textEditingController: controller.descController,
                    hint: "Enter the description",
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
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.currency_bitcoin),
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: Get.width * 0.7,
                  child: CustomTextFormField(
                    textEditingController: controller.expenseController,
                    hint: "Add Expenses",
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
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                SizedBox(
                  child: Text(
                    "Paid By : ",
                    style: GoogleFonts.lato(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {
                    onPaidBy();
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(Get.context!).canvasColor,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "CURRENT USER",
                      style: GoogleFonts.lato(fontSize: 18.0),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Divider(),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Split Between :",
                style:
                    GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Obx(
                () => Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: List.generate(
                    (controller.selectedGroupModel.value.members?.values
                                .toList() ??
                            [])
                        .length, // Use converted list length
                    (idx) => Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Theme.of(Get.context!).primaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        controller.selectedGroupModel.value.members!.values
                            .toList()[idx]
                            .userName, // Use the list directly
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                        maxLines: 3,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            ElevatedButton(
                onPressed: () {
                  controller.addExpense();
                },
                child: Text("Add"))
          ],
        ),
      ),
    );
  }

  onPaidBy() {
    return CustomBottomSheet.showBottomSheet(
        isScroll: false,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 20),
                  decoration: BoxDecoration(
                      color: Theme.of(Get.context!).primaryColor,
                      borderRadius: BorderRadius.circular(8)),
                  height: 4,
                  width: 40,
                ),
              ),
              // Wrap(
              //   spacing: 10.0,
              //   runSpacing: 10,
              //   alignment: WrapAlignment.start,
              //   children: [
              //     Container(
              //       padding: const EdgeInsets.symmetric(
              //         horizontal: 10,
              //       ),
              //       decoration: BoxDecoration(
              //           color: Theme.of(Get.context!).primaryColor,
              //           borderRadius: BorderRadius.circular(8)),
              //       child: const Text(
              //         "Split Equally",
              //         style: TextStyle(color: Colors.white, fontSize: 18.0),
              //         maxLines: 3,
              //       ),
              //     ),
              //     Container(
              //       padding: const EdgeInsets.symmetric(
              //         horizontal: 10,
              //       ),
              //       decoration: BoxDecoration(
              //           color: Theme.of(Get.context!).primaryColor,
              //           borderRadius: BorderRadius.circular(8)),
              //       child: const Text(
              //         "Split Unequally",
              //         style: TextStyle(color: Colors.white, fontSize: 18.0),
              //         maxLines: 3,
              //       ),
              //     ),
              //   ],
              // ),
              // Divider(),
              Flexible(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) => ListTile(
                          title: Text("User Name $index"),
                        )),
              )
            ],
          ),
        ));
  }
}
