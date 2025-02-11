import 'package:courierapp/core/common/widgets/create_trip_top_body.dart';
import 'package:courierapp/core/common/widgets/custom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_bottom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/custom_text_form_field.dart';
import 'package:courierapp/core/common/widgets/error_snakbar.dart';
import 'package:courierapp/core/common/widgets/message_notification_box.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/helpers/app_helper.dart';
import 'package:courierapp/features/create_trip/controller/create_trip_controller.dart';
import 'package:courierapp/features/create_trip/presentation/screens/select_departing_from_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TravelingDateSelectScreen extends StatelessWidget {
  TravelingDateSelectScreen({super.key});
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
                  text: "When are you traveling?",
                  color: AppColors.black,
                  fontSize: getWidth(18),
                ),
                VerticalSpace(height: getHeight(16)),
                CustomTexFormField(
                  controller: tripController.dateTimeController,
                  onTap: () {
                    tripController.selectDate(context);
                  },
                  readOnly: true,
                  hintText:
                      AppHelperFunctions.formateDate(DateTime.now().toString()),
                  suffixIcon: Icon(
                    Icons.calendar_month,
                    color: AppColors.grey,
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
            tripController.dateTimeController.text.isNotEmpty
                ? Get.to(
                    () => SelectDepartingFromScreen(),
                    transition: Transition.rightToLeftWithFade,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeOut,
                  )
                : errorSnakbar(
                    errorMessage: "Please select your traveling date");
          }),
    );
  }
}
