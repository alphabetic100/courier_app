import 'package:courierapp/core/common/widgets/create_trip_top_body.dart';
import 'package:courierapp/core/common/widgets/custom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_bottom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/message_notification_box.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/features/create_trip/controller/create_trip_controller.dart';
import 'package:courierapp/features/create_trip/presentation/screens/charge_per_kg_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectMaximumWeightScreen extends StatelessWidget {
  SelectMaximumWeightScreen({super.key});
  final CreateTripController tripController = Get.find<CreateTripController>();
  @override
  Widget build(BuildContext context) {
    tripController.getWeight();
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CreateTripTopBody(title: "Create a trip"),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "What's the maximum weight you can transport?",
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: getWidth(16),
                ),
                VerticalSpace(height: getHeight(16)),
                Row(
                  children: [
                    CustomText(
                      text: "Unlimited",
                      fontSize: getWidth(15),
                      color: AppColors.titleTextColor,
                    ),
                    SizedBox(
                      height: getHeight(20),
                      width: getWidth(40),
                      child: Transform.scale(
                        scale: 0.65,
                        child: Obx(
                          () => CupertinoSwitch(
                            thumbColor: tripController.isUnlimited.value
                                ? AppColors.primaryColor
                                : Color(0xFFCCD9D6),
                            activeColor: Color(0xFFF3F3F5),
                            value: tripController.isUnlimited.value,
                            onChanged: (value) {
                              tripController.makeUnlimited();
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Obx(
                  () => tripController.isUnlimited.value
                      ? SizedBox.shrink()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            VerticalSpace(height: getHeight(10)),
                            Row(
                              children: [
                                CustomText(
                                  text: "1kg",
                                  color: AppColors.titleTextColor,
                                ),
                                Expanded(
                                  child: Obx(
                                    () => Slider(
                                      activeColor: AppColors.primaryColor,
                                      value: tripController.itemWeight.value,
                                      min: 1.0,
                                      max: 100,
                                      divisions: 100,
                                      // divisions: 18,
                                      onChanged: (value) {
                                        tripController.itemWeight.value =
                                            double.parse(
                                                value.toStringAsFixed(1));
                                      },
                                    ),
                                  ),
                                ),
                                CustomText(
                                  text: "100kg",
                                  color: AppColors.titleTextColor,
                                )
                              ],
                            ),
                            VerticalSpace(height: getHeight(15)),
                            SizedBox(
                              width: AppSizes.width,
                              child: Align(
                                alignment: Alignment.center,
                                child: CustomButton(
                                  width: AppSizes.width * 0.45,
                                  isPrimary: false,
                                  onPressed: () {},
                                  child: Obx(() => Center(
                                        child: CustomText(
                                            color: AppColors.titleTextColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: getWidth(40),
                                            text:
                                                "${tripController.itemWeight.value.toStringAsFixed(1)} kg"),
                                      )),
                                ),
                              ),
                            )
                          ],
                        ),
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
              () => ChargePerKgScreen(),
              transition: Transition.rightToLeftWithFade,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
            );
          }),
    );
  }
}
