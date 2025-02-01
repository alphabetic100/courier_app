import 'package:courierapp/core/common/widgets/custom_app_bar.dart';
import 'package:courierapp/core/common/widgets/message_notification_box.dart';
import 'package:courierapp/core/common/widgets/trip_details_top_body.dart';
import 'package:courierapp/core/common/widgets/trip_details_view.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/icon_path.dart';
import 'package:courierapp/features/my_trip/controller/my_trip_controller.dart';
import 'package:courierapp/features/my_trip/presentation/widgets/sender_request_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TravelTripDetailScreen extends StatelessWidget {
  TravelTripDetailScreen({super.key});
  final MyTripController myTripController = Get.find<MyTripController>();
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            TripDetailsTopBody(
              title: "Trip Details",
              departingFrom: "32,C.nuñez de balboa, Madrid",
              arrivingTo: "32,C.nuñez de balboa, Madrid",
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getWidth(16),
              ),
              child: Column(
                children: [
                  TripDetailsView(
                      tripTransport: "Bus",
                      carNumber: "DL-88372",
                      availabileSpace: "5kg",
                      tripRules: [
                        "No perishable food items without proper packaging.",
                        "No fragile items unless securely packaged."
                      ],
                      transportIcon: IconPath.directionsBus,
                      date: "14 Jan 2025",
                      tripAdvantate: [
                        "Will pickup the items from the sender's location.",
                        "Will deliver directly to recipient’s door."
                      ]),
                  // if (myTripController.status.value
                  //     .toLowerCase()
                  //     .contains("panding")) ...[
                  VerticalSpace(height: getHeight(20)),
                  SenderRequestCard(),
                  // ]
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
