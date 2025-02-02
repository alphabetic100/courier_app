import 'package:courierapp/core/common/widgets/custom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_bottom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/message_notification_box.dart';
import 'package:courierapp/core/common/widgets/trip_details_top_body.dart';
import 'package:courierapp/core/common/widgets/trip_details_view.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/features/create_trip/controller/create_trip_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateTripSummary extends StatelessWidget {
  CreateTripSummary({super.key});
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
          TripDetailsTopBody(
            title: "Create a Trip",
            departingFrom: tripController.selectDepartingController.text,
            arrivingTo: tripController.selectArrivingController.text,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
            child: TripDetailsView(
              tripTransport: tripController.selectedTransportType,
              availabileSpace: tripController.itemWeight.toString(),
              date: tripController.dateTimeController.text,
              tripAdvantate: [
                "Will pickup the items from the sender's location.",
                "Will deliver directly to recipient’s door."
              ],
              tripRules: [
                "No perishable food items without proper packaging.",
                "No fragile items unless securely packaged.",
              ],
              transportIcon: tripController.selectedIconPath,
            ),
          )
        ],
      ),
      bottomNavigationBar: CustomBottomAppBar(
        isPrimaryButton: false,
        onTap: () {},
        primaryWidget: Row(
          children: [
            Expanded(
              child: CustomButton(
                  isPrimary: false,
                  onPressed: () {
                    // Get.defaultDialog(
                    //   title: "Worning",
                    // );
                    // showDialog(
                    //     context: context,
                    //     builder: (context) {
                    //       return ShowPaymentSuccessDialog();
                    //     });
                  },
                  child: CustomText(
                    text: "Cencel",
                    fontWeight: FontWeight.bold,
                    color: AppColors.grey,
                  )),
            ),
            HorizontalSpace(width: getWidth(16)),
            Expanded(
              child: CustomButton(
                  onPressed: () {
                    tripController.createTrip();
                  },
                  child: CustomText(
                    text: "Create Trip",
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
