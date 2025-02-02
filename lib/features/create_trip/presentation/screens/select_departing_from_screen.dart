import 'package:courierapp/core/common/styles/get_text_style.dart';
import 'package:courierapp/core/common/widgets/create_trip_top_body.dart';
import 'package:courierapp/core/common/widgets/custom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_bottom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/error_snakbar.dart';
import 'package:courierapp/core/common/widgets/message_notification_box.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/image_path.dart';
import 'package:courierapp/features/create_trip/controller/create_trip_controller.dart';
import 'package:courierapp/features/create_trip/presentation/screens/select_arriving_to_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectDepartingFromScreen extends StatelessWidget {
  SelectDepartingFromScreen({super.key});
  final CreateTripController tripController = Get.find<CreateTripController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: getWidth(16)),
            child: MessageNotificationBox(),
          )
        ],
      ),
      body: Column(
        children: [
          CreateTripTopBody(title: "Create a Trip"),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Where are you departing from?",
                    color: AppColors.black,
                    fontSize: getWidth(18),
                  ),
                  VerticalSpace(height: getHeight(10)),
                  CustomText(
                    text:
                        "Please put here the address where you are going to receive the items",
                    color: AppColors.bodyTextColor,
                    fontSize: getWidth(15),
                    fontWeight: FontWeight.normal,
                  ),
                  VerticalSpace(height: getHeight(10)),
                  TextField(
                    controller: tripController.selectDepartingController,
                    style: getTextStyleMsrt(),
                    decoration: InputDecoration(
                      suffixIcon: Padding(
                        padding: EdgeInsets.all(getWidth(16)),
                        child: Image.asset(
                          ImagePath.location,
                          height: getWidth(15),
                          color: AppColors.grey,
                        ),
                      ),
                      hintText: "Paris, Spain",
                      hintStyle: getTextStyleMsrt(color: AppColors.grey),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  VerticalSpace(height: getHeight(20)),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.grey,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: CustomBottomAppBar(
        isPrimaryButton: true,
        onTap: () {
          tripController.selectDepartingController.text.isNotEmpty
              ? Get.to(
                  () => SelectArrivingToScreen(),
                  transition: Transition.rightToLeftWithFade,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeOut,
                )
              : errorSnakbar(
                  errorMessage: "Please select where are you departing from");
        },
      ),
    );
  }
}
