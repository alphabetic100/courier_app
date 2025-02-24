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
import 'package:courierapp/features/landing/controller/landing_controller.dart';
import 'package:courierapp/features/landing/presentation/screens/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateTripSummary extends StatelessWidget {
  CreateTripSummary({super.key});
  final CreateTripController tripController = Get.find<CreateTripController>();
  final LandingController landingController = Get.find<LandingController>();
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TripDetailsTopBody(
              title: "Create a Trip",
              departingFrom: tripController.selectDepartingController.text,
              arrivingTo: tripController.selectArrivingController.text,
              price: "${tripController.selectedCharge.value}/kg",
              date: tripController.dateTimeController.text,
              lat1: tripController.lat1,
              lon1: tripController.long1,
              lat2: tripController.lat2,
              lon2: tripController.long2,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
              child: TripDetailsView(
                tripTransport: tripController.selectedTransportType,
                availabileSpace: tripController.weight,
                tripAdvantate: tripController.supportSet,
                tripRules: tripController.rulesSet,
                carNumber: tripController.carNumberController.text,
              ),
            )
          ],
        ),
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
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Center(
                              child: CustomText(
                                text: "Worning",
                                color: AppColors.error,
                                fontSize: getHeight(18),
                              ),
                            ),
                            content: SizedBox(
                              width: double.maxFinite,
                              child: CustomText(
                                text:
                                    "If you cancel now, all entered data will be lost. Are you sure you want to proceed?",
                                textAlign: TextAlign.center,
                                color: AppColors.black,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            actions: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: CustomButton(
                                        isPrimary: false,
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: CustomText(
                                          text: "Finish post",
                                          fontWeight: FontWeight.w500,
                                        )),
                                  ),
                                  HorizontalSpace(width: getWidth(16)),
                                  Expanded(
                                    child: CustomButton(
                                        isPrimary: true,
                                        onPressed: () {
                                          Get.back();
                                          Get.offAll(() => LandingScreen());
                                        },
                                        child: CustomText(
                                          text: "Confirm lave",
                                          color: AppColors.white,
                                          fontWeight: FontWeight.w500,
                                        )),
                                  )
                                ],
                              )
                            ],
                          );
                        });
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
