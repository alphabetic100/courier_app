import 'package:courierapp/core/common/widgets/create_trip_top_body.dart';
import 'package:courierapp/core/common/widgets/custom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_bottom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/message_notification_box.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/features/create_trip/controller/create_trip_controller.dart';
import 'package:courierapp/features/create_trip/presentation/screens/set_rules_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChargePerKgScreen extends StatelessWidget {
  ChargePerKgScreen({super.key});
  final CreateTripController tripController = Get.find<CreateTripController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: getWidth(16),
            ),
            child: MessageNotificationBox(),
          ),
        ],
      ),
      body: Column(
        children: [
          CreateTripTopBody(title: "Create a trip"),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "How much would you like to charge per KG?",
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: getWidth(16),
                ),
                VerticalSpace(height: getHeight(16)),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                      height: getHeight(100),
                      width: getWidth(170),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Color(0xFFCCD9D6))),
                      child: Center(
                        child: Obx(
                          () => DropdownButton<String>(
                            underline: SizedBox.shrink(),
                            selectedItemBuilder: (context) => tripController
                                .chargeRange
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: CustomText(
                                  text: value,
                                  color: AppColors.titleTextColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: getWidth(40),
                                ),
                              );
                            }).toList(),
                            value: tripController.selectedCharge.value,
                            onChanged: (String? newValue) {
                              tripController.selectedCharge.value = newValue!;
                            },
                            items: tripController.chargeRange
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: CustomText(
                                  text: value,
                                  color: AppColors.titleTextColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: getWidth(20),
                                ),
                              );
                            }).toList(),
                            hint: CustomText(
                              text: 'Select an item',
                            ),
                            isExpanded: false,
                            padding: EdgeInsets.all(0),
                          ),
                        ),
                      )),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: CustomBottomAppBar(
          isPrimaryButton: true,
          onTap: () {
            Get.to(
              () => SetRulesScreen(),
              transition: Transition.rightToLeftWithFade,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          }),
    );
  }
}
