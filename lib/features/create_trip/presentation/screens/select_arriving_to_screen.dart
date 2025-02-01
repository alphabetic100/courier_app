import 'package:courierapp/core/common/styles/get_text_style.dart';
import 'package:courierapp/core/common/widgets/create_trip_top_body.dart';
import 'package:courierapp/core/common/widgets/custom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_bottom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/message_notification_box.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/image_path.dart';
import 'package:courierapp/features/create_trip/presentation/screens/select_maximum_weight.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectArrivingToScreen extends StatelessWidget {
  const SelectArrivingToScreen({super.key});

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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CreateTripTopBody(title: "Create a Trip"),
            CustomText(
              text: "Where are you arriving to?",
              color: AppColors.black,
              fontSize: getWidth(18),
            ),
            VerticalSpace(height: getHeight(10)),
            CustomText(
              text:
                  "Please put here the address where you are going to arrive with the items",
              color: AppColors.bodyTextColor,
              fontSize: getWidth(15),
              fontWeight: FontWeight.normal,
            ),
            VerticalSpace(height: getHeight(10)),
            TextField(
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
                  )),
            ))
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(
          isPrimaryButton: true,
          onTap: () {
            Get.to(
              () => SelectMaximumWeightScreen(),
              transition: Transition.rightToLeftWithFade,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          }),
    );
  }
}
