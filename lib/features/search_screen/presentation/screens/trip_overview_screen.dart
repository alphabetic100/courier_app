import 'package:courierapp/core/common/widgets/custom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/message_notification_box.dart';
import 'package:courierapp/core/common/widgets/trip_details_top_body.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/helpers/app_helper.dart';
import 'package:courierapp/features/messege/presentation/screens/chat_screens.dart';
import 'package:courierapp/features/request_shipping/presentation/request_shipping_screen.dart';
import 'package:courierapp/features/search_screen/controller/trip_overview_controller.dart';
import 'package:courierapp/features/search_screen/models/all_trip_model.dart';
import 'package:courierapp/features/search_screen/presentation/components/trip_overview_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TripOverviewScreen extends StatelessWidget {
  TripOverviewScreen({super.key, required this.trip});
  final TripOverviewController tripOverviewController =
      Get.find<TripOverviewController>();
  final TransportData trip;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: Color(0xffFAFAFC),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: getWidth(16)),
            child: MessageNotificationBox(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TripDetailsTopBody(
              title: "Trip Overview",
              departingFrom: trip.from,
              arrivingTo: trip.to,
              price: trip.price.toString().replaceAll("\$", ""),
              date: AppHelperFunctions.formateDate(trip.date),
            ),

            //Trip Overview Details
            Padding(
              padding: EdgeInsets.only(left: getWidth(16), right: getWidth(16)),
              child: TripOverviewDetails(
                trip: trip,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: AppSizes.height * 0.17,
        padding: EdgeInsets.only(
            left: getHeight(16), right: getHeight(16), bottom: getHeight(16)),
        color: Color(0xffFFFFFF),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
                isPrimary: false,
                onPressed: () {
                  Get.to(() => ChatInboxScreen(
                        user2ndId: trip.user.id,
                      ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.bubble_left,
                      color: AppColors.grey,
                      size: getHeight(30),
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
                  Get.to(() => RequestShippingScreen(
                        trip: trip,
                      ));
                },
                child: CustomText(
                  text: "Request Shipping",
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                )),
            VerticalSpace(height: getHeight(16)),
          ],
        ),
      ),
    );
  }
}
