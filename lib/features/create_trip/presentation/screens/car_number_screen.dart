import 'package:courierapp/core/common/widgets/create_trip_top_body.dart';
import 'package:courierapp/core/common/widgets/custom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_bottom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/custom_text_form_field.dart';
import 'package:courierapp/core/common/widgets/message_notification_box.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/features/create_trip/controller/create_trip_controller.dart';
import 'package:courierapp/features/create_trip/presentation/screens/traveling_date_select_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarNumberScreen extends StatelessWidget {
  CarNumberScreen({super.key});
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CreateTripTopBody(title: "Create a Trip"),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text:
                      "What is your ${tripController.selectedTransportType.toLowerCase()} number? (Optional)",
                  color: AppColors.black,
                  fontSize: getWidth(18),
                ),
                VerticalSpace(height: getHeight(16)),
                CustomTexFormField(
                  controller: tripController.carNumberController,
                  hintText: "Enter your bus number",
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
              () => TravelingDateSelectScreen(),
              transition: Transition.rightToLeftWithFade,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          }),
    );
  }
}
