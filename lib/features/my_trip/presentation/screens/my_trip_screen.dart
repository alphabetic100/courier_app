import 'package:courierapp/core/common/widgets/as_traveller_card.dart';
import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/message_notification_box.dart';
import 'package:courierapp/core/common/widgets/my_trip_card.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/features/landing/controller/landing_controller.dart';
import 'package:courierapp/features/my_trip/controller/my_bookings_controller.dart';
import 'package:courierapp/features/my_trip/controller/my_trip_controller.dart';
import 'package:courierapp/features/my_trip/presentation/screens/delivery_details_screen.dart';
import 'package:courierapp/features/my_trip/presentation/screens/travel_trip_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class MyTripScreen extends StatefulWidget {
  const MyTripScreen({super.key});

  @override
  State<MyTripScreen> createState() => _MyTripScreenState();
}

class _MyTripScreenState extends State<MyTripScreen> {
  final MyTripController controller = Get.put(MyTripController());
  final LandingController landingController = Get.find<LandingController>();
  final MyBookingsController myBookingsController =
      Get.put(MyBookingsController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.selectedIndex.value = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.white,
            surfaceTintColor: Colors.transparent,
            floating: true,
            pinned: true,
            expandedHeight: getHeight(150),
            leading: Padding(
              padding: EdgeInsets.only(
                  left: getWidth(12), top: getWidth(5), bottom: getWidth(5)),
              child: CustomButton(
                isPrimary: false,
                onPressed: () {
                  landingController.changePage(0);
                  controller.selectedIndex.value = 0;
                },
                child: Center(
                  child: Icon(
                    CupertinoIcons.back,
                    color: AppColors.grey,
                  ),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: const Color(0xFFFAFAFC),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    VerticalSpace(height: getHeight(10)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
                      child: CustomText(
                        text: "My Trips",
                        fontSize: getWidth(24),
                        color: AppColors.titleTextColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    VerticalSpace(height: getHeight(10)),
                    const Divider(height: 1),
                    VerticalSpace(height: getHeight(10)),
                  ],
                ),
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
                child: MessageNotificationBox(),
              ),
            ],
          ),
          SliverPersistentHeader(
            delegate: _SliverAppBarDelegate(
              child: Container(
                color: AppColors.white,
                padding: EdgeInsets.symmetric(
                    horizontal: getWidth(16), vertical: getHeight(8)),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          controller.selectedIndex.value = 0;
                          controller.pageController.animateToPage(
                            0,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Obx(
                          () => Container(
                            padding: EdgeInsets.symmetric(
                              vertical: getHeight(10),
                              horizontal: getWidth(16),
                            ),
                            decoration: BoxDecoration(
                              color: controller.selectedIndex.value == 0
                                  ? AppColors.primaryColor.withOpacity(0.3)
                                  : null,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: controller.selectedIndex.value == 0
                                    ? AppColors.primaryColor
                                    : AppColors.grey,
                              ),
                            ),
                            child: Center(
                              child: CustomText(
                                text: "As Sender",
                                fontSize: getWidth(16),
                                color: controller.selectedIndex.value == 0
                                    ? AppColors.primaryColor
                                    : null,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: getWidth(16)),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          controller.selectedIndex.value = 1;
                          controller.pageController.animateToPage(
                            1,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Obx(
                          () => Container(
                            padding: EdgeInsets.symmetric(
                              vertical: getHeight(10),
                              horizontal: getWidth(16),
                            ),
                            decoration: BoxDecoration(
                              color: controller.selectedIndex.value == 1
                                  ? AppColors.primaryColor.withOpacity(0.3)
                                  : null,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: controller.selectedIndex.value == 1
                                    ? AppColors.primaryColor
                                    : AppColors.grey,
                              ),
                            ),
                            child: Center(
                              child: CustomText(
                                text: "As Traveller",
                                fontSize: getWidth(16),
                                color: controller.selectedIndex.value == 1
                                    ? AppColors.primaryColor
                                    : null,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            pinned: true,
          ),
        ],
        body: PageView(
          controller: controller.pageController,
          onPageChanged: (index) {
            controller.selectedIndex.value = index;
          },
          children: [
            RefreshIndicator(
                child: Obx(() {
                  if (myBookingsController.isLoading.value) {
                    return Center(
                      child: SpinKitFadingCircle(
                        color: AppColors.primaryColor,
                        size: getWidth(50),
                      ),
                    );
                  }
                  if (myBookingsController.myBookings.value == null ||
                      myBookingsController.myBookings.value!.data.isEmpty) {
                    return const Center(
                      child: CustomText(text: "No Bookings Yet"),
                    );
                  }

                  return ListView.builder(
                    padding: EdgeInsets.only(top: getHeight(4)),
                    itemCount:
                        myBookingsController.myBookings.value!.data.length,
                    itemBuilder: (context, index) {
                      final booking =
                          myBookingsController.myBookings.value!.data[index];
                      return Padding(
                        padding: EdgeInsets.all(getWidth(16)),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => DeliveryDetailsScreen(
                                  bookingID: booking.bookingId,
                                ));
                          },
                          child: MyBookingsCard(
                            booking: booking,
                          ),
                        ),
                      );
                    },
                  );
                }),
                onRefresh: () =>
                    myBookingsController.getMyBookings(onRefresh: true)),

            // As Traveller part
            RefreshIndicator(
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return Center(
                      child: SpinKitFadingCircle(
                        color: AppColors.primaryColor,
                        size: getWidth(50),
                      ),
                    );
                  }
                  if (controller.myTravels.value == null ||
                      controller.myTravels.value!.data
                          .transportsWithPendingCount.isEmpty) {
                    return const Center(
                      child: CustomText(text: "No Travel Yet"),
                    );
                  }
                  final tripDatas = controller
                      .myTravels.value!.data.transportsWithPendingCount;

                  return ListView.builder(
                    padding: EdgeInsets.only(top: getHeight(4)),
                    itemCount: tripDatas.length,
                    itemBuilder: (context, index) {
                      final tripData = tripDatas[index];
                      return Padding(
                        padding: EdgeInsets.all(getWidth(16)),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => TravelTripDetailScreen(
                                  trip: tripData,
                                ));
                          },
                          child: AsTravellerCard(
                            from: tripData.from,
                            to: tripData.to,
                            price: tripData.price.toString(),
                            availableSpace: tripData.weight,
                            status: tripData.weight != "0.0"
                                ? tripData.pendingCount > 0
                                    ? "${tripData.pendingCount} Requests Pending"
                                    : "No Request Yet"
                                : "Fully Booked",
                          ),
                        ),
                      );
                    },
                  );
                }),
                onRefresh: () => controller.refreshTravellPosts())
          ],
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _SliverAppBarDelegate({required this.child});

  @override
  double get minExtent => 60;
  @override
  double get maxExtent => 60;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
