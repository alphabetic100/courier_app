import 'package:courierapp/core/common/widgets/custom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/message_notification_box.dart';
import 'package:courierapp/core/common/widgets/trip_details_top_body.dart';
import 'package:courierapp/core/common/widgets/trip_details_view.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/features/my_trip/controller/my_trip_controller.dart';
import 'package:courierapp/features/my_trip/models/me_as_traveller_model.dart';
import 'package:courierapp/features/my_trip/presentation/widgets/sender_request_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TravelTripDetailScreen extends StatefulWidget {
  const TravelTripDetailScreen({super.key, required this.trip});
  final TransportData trip;

  @override
  State<TravelTripDetailScreen> createState() => _TravelTripDetailScreenState();
}

class _TravelTripDetailScreenState extends State<TravelTripDetailScreen> {
  final MyTripController myTripController = Get.find<MyTripController>();

  fetchSinglePost() {
    myTripController.getSingleTravelPost(widget.trip.id);
  }

  @override
  void initState() {
    fetchSinglePost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (myTripController.isTravelLoading.value) {
        return Scaffold(
          body: Center(
            child: SpinKitFadingCircle(
              color: AppColors.primaryColor,
              size: getWidth(50),
            ),
          ),
        );
      } else if (myTripController.singleTravel.value == null) {
        return Scaffold(
          appBar: CustomAppBar(
            actions: [
              Padding(
                padding: EdgeInsets.only(right: getWidth(16)),
                child: MessageNotificationBox(),
              ),
            ],
          ),
          body: Center(
            child: CustomText(
                text: "Check your internet connection and try again"),
          ),
        );
      } else {
        final post = myTripController.singleTravel.value!.data;
        return Scaffold(
          appBar: CustomAppBar(
            actions: [
              Padding(
                padding: EdgeInsets.only(right: getWidth(16)),
                child: MessageNotificationBox(),
              ),
            ],
          ),
          body: RefreshIndicator(
            onRefresh: () =>
                myTripController.refreshSingleTravelPost(widget.trip.id),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TripDetailsTopBody(
                    title: "Trip Details",
                    departingFrom: post.from,
                    arrivingTo: post.to,
                    price: "${post.price.toString()}/kg",
                    date: DateFormat("MMM d, yyyy")
                        .format(DateTime.parse(post.date)),
                    lat1: post.lat1,
                    lon1: post.lon2,
                    lat2: post.lat2,
                    lon2: post.lon2,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getWidth(16),
                    ),
                    child: Column(
                      children: [
                        TripDetailsView(
                            tripTransport: post.transportType,
                            carNumber: post.transportNumber,
                            availabileSpace: post.weight,
                            tripRules: post.rulse,
                            tripAdvantate: post.additional),
                        VerticalSpace(height: getHeight(20)),
                        SenderRequestCard(
                          bookings: post.booking,
                        ),
                        VerticalSpace(height: getHeight(20))
                        // ]
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }
    });
  }
}
