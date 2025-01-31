import 'package:courierapp/core/common/widgets/custom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/message_notification_box.dart';
import 'package:courierapp/core/common/widgets/trip_details_top_body.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/features/chat_with_traveller/presentation/chat_with_traveller_screen.dart';
import 'package:courierapp/features/request_shipping/presentation/request_shipping_screen.dart';
import 'package:courierapp/features/search_screen/controller/trip_overview_controller.dart';
import 'package:courierapp/features/search_screen/presentation/components/trip_overview_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TripOverviewScreen extends StatelessWidget {
  TripOverviewScreen({super.key});
  final TripOverviewController tripOverviewController =
      Get.find<TripOverviewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: getWidth(16)),
            child: MessageNotificationBox(),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TripDetailsTopBody(title: "Trip Overview"),

            //Trip Overview Details
            TripOverviewDetails(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: AppSizes.height * 0.135,
        padding: EdgeInsets.only(
            left: getHeight(16), right: getHeight(16), bottom: getHeight(16)),
        color: AppColors.white,
        child: Column(
          children: [
            CustomButton(
                isPrimary: false,
                onPressed: () {
                  Get.to(() => ChatWithTravellerScreen());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.bubble_left,
                      color: AppColors.grey,
                    ),
                    HorizontalSpace(width: getWidth(5)),
                    CustomText(
                      text: "Chat With Traveller",
                      fontWeight: FontWeight.bold,
                    )
                  ],
                )),
            VerticalSpace(height: getHeight(16)),
            CustomButton(
                isPrimary: true,
                onPressed: () {
                  Get.to(() => RequestShippingScreen());
                },
                child: CustomText(
                  text: "Request Shipping",
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                )),
          ],
        ),
      ),
    );
  }
}
