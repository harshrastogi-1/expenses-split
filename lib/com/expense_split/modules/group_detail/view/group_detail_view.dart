import 'package:expense_split/com/expense_split/enums/group_type_enum.dart';
import 'package:expense_split/com/expense_split/modules/group_detail/controller/group_detail_controller.dart';
import 'package:expense_split/com/expense_split/page_routes/page_route_constants.dart';
import 'package:expense_split/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../base/data/helper/common_utils.dart';
import '../../../entity/ui_model.dart';

class GroupDetailView extends StatelessWidget {
  GroupDetailView({super.key});
  final GroupDetailController controller = Get.find<GroupDetailController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.edit,
                color: Theme.of(context).primaryColor,
              ))
        ],
        title: Row(
          children: [
            Icon(CommonUtils.getGroupType(GroupType.trip)),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                controller.selectedGroupModel.value.name ?? " ",
                style: GoogleFonts.merriweather(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).primaryColor),
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Obx(
              () => Text(
                "Group Summary : ${controller.totalAmount.value}",
                style: GoogleFonts.merriweather(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).primaryColor),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Obx(
              () => Text(
                "Your Total Payments : ${controller.totalPaymentsMade.value}",
                style: GoogleFonts.merriweather(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).primaryColor),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Obx(
              () => Text(
                "Amount You Owe : ${controller.totalAmountOwed.value}",
                style: GoogleFonts.merriweather(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).primaryColor),
              ),
            ),
          ),
          const Divider(),
          // Obx(
          //   () => controller.expensesList.isNotEmpty
          //       ? Column(
          //           children: [
          //             GestureDetector(
          //               onTap: () {
          //                 controller.isExpanded.value =
          //                     !controller.isExpanded.value;
          //               },
          //               child: Padding(
          //                 padding: const EdgeInsets.symmetric(horizontal: 20),
          //                 child: Row(
          //                   children: [
          //                     Text(
          //                       "Summary",
          //                       style: GoogleFonts.merriweather(
          //                         fontSize: 15,
          //                         fontWeight: FontWeight.w700,
          //                         color: Theme.of(context).primaryColor,
          //                       ),
          //                     ),
          //                     Obx(
          //                       () => Icon(
          //                         controller.isExpanded.value
          //                             ? Icons.keyboard_arrow_down_outlined
          //                             : Icons.keyboard_arrow_up_outlined,
          //                         color: Theme.of(context).primaryColor,
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //             ),
          //             Obx(
          //               () => AnimatedSize(
          //                 duration: const Duration(milliseconds: 300),
          //                 curve: Curves.easeInOut,
          //                 child: controller.isExpanded.value
          //                     ? Container(
          //                         margin: const EdgeInsets.symmetric(
          //                             vertical: 10, horizontal: 10),
          //                         decoration: BoxDecoration(
          //                             color: Theme.of(context).canvasColor,
          //                             borderRadius: BorderRadius.circular(30)),
          //                         padding: const EdgeInsets.symmetric(
          //                             horizontal: 20, vertical: 10),
          //                         child: Text(
          //                           "Here is your expandable summary content. The height of this container adjusts dynamically based on the content inside it.",
          //                           style:
          //                               GoogleFonts.merriweather(fontSize: 14),
          //                         ),
          //                       )
          //                     : const SizedBox(),
          //               ),
          //             ),
          //             const Divider(),
          //           ],
          //         )
          //       : SizedBox.shrink(),
          // ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.expensesList.length,
                itemBuilder: (context, index) =>
                    itemWidget(context, controller.expensesList[index]),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: () {
              controller.settlePayment();
            },
            child: const Icon(
              Icons.handshake_rounded,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: () {
              Get.toNamed(PageRouteConstants.addExpensesScreen);
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget itemWidget(BuildContext context, ExpenseEntity expenseModel) {
    return AspectRatio(
      aspectRatio: 40 / 9,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.circular(30)),
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1 / 1,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Theme.of(Get.context!).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  DateFormat('dd MMM')
                      .format(DateTime.fromMillisecondsSinceEpoch(
                          expenseModel.timestamp))
                      .toString()
                      .replaceFirst(' ', '\n'),
                  style: GoogleFonts.merriweather(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).primaryColor),
                  maxLines: 2,
                  textAlign: TextAlign.center,
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
                    expenseModel.description,
                    style: GoogleFonts.lato(fontSize: 16),
                  ),
                  Text(
                    "${controller.selectedGroupModel.value.members![expenseModel.paidBy]!.userName} Paid :  ${expenseModel.amount} \$",
                    style: GoogleFonts.lato(fontSize: 12),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  expenseModel.paidBy == currentUserId
                      ? "You lent"
                      : "You Borrow",
                  style: GoogleFonts.lato(
                      fontSize: 10,
                      color: expenseModel.paidBy == currentUserId
                          ? Colors.green
                          : Colors.red),
                ),
                Text(
                  "${expenseModel.splitAmong[currentUserId]?.amountOwed ?? 0}",
                  style: GoogleFonts.lato(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: expenseModel.paidBy == currentUserId
                          ? Colors.green
                          : Colors.red),
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
