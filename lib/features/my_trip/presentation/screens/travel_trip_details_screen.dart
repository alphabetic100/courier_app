import 'package:courierapp/core/common/widgets/custom_app_bar.dart';
import 'package:courierapp/core/common/widgets/message_notification_box.dart';
import 'package:courierapp/core/common/widgets/trip_details_top_body.dart';
import 'package:courierapp/core/common/widgets/trip_details_view.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/features/my_trip/controller/my_trip_controller.dart';
import 'package:courierapp/features/my_trip/models/me_as_traveller_model.dart';
import 'package:courierapp/features/my_trip/presentation/widgets/sender_request_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TravelTripDetailScreen extends StatelessWidget {
  TravelTripDetailScreen({super.key, required this.trip});
  final MyTripController myTripController = Get.find<MyTripController>();
  final TransportData trip;
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
              departingFrom: trip.from,
              arrivingTo: trip.to,
              price: "${trip.price.toString()}/kg",
              date: DateFormat("MMM d, yyyy").format(DateTime.parse(trip.date)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getWidth(16),
              ),
              child: Column(
                children: [
                  TripDetailsView(
                      tripTransport: trip.transportType,
                      carNumber: trip.transportNumber,
                      availabileSpace: "",
                      tripRules: trip.rules,
                      tripAdvantate: trip.additional),
                  // if (myTripController.status.value
                  //     .toLowerCase()
                  //     .contains("panding")) ...[
                  VerticalSpace(height: getHeight(20)),
                  SenderRequestCard(),
                  VerticalSpace(height: getHeight(20))
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
