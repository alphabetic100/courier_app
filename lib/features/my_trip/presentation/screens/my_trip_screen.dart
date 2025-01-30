import 'package:courierapp/core/common/widgets/as_traveller_card.dart';
import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/message_notification_box.dart';
import 'package:courierapp/core/common/widgets/my_trip_card.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/features/landing/controller/landing_controller.dart';
import 'package:courierapp/features/my_trip/controller/my_trip_controller.dart';
import 'package:courierapp/features/my_trip/presentation/screens/delivery_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTripScreen extends StatelessWidget {
  const MyTripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MyTripController controller = Get.put(MyTripController());
    final LandingController landingController = Get.find<LandingController>();

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.white,
            floating: true,
            pinned: true,
            expandedHeight: getHeight(180),
            leading: Padding(
              padding: EdgeInsets.only(
                  left: getWidth(12), top: getWidth(6), bottom: getWidth(6)),
              child: CustomButton(
                  isPrimary: false,
                  onPressed: () {
                    landingController.changePage(0);
                  },
                  child: Center(
                    child: Icon(
                      CupertinoIcons.back,
                      color: AppColors.grey,
                    ),
                  )),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
                      child: CustomText(
                        text: "My Trips",
                        fontSize: getWidth(24),
                        color: AppColors.titleTextColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    VerticalSpace(height: getHeight(20)),
                    Divider(),
                  ]),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
                child: MessageNotificationBox(),
              ),
            ],
          ),
          SliverPersistentHeader(
            delegate: _TabBarDelegate(
              TabBar(
                controller: controller.tabController,
                overlayColor: WidgetStatePropertyAll(Colors.transparent),
                dividerColor: Colors.transparent,
                tabs: [
                  GestureDetector(
                      onTap: () {
                        controller.selectedIndex.value = 0;
                        controller.tabController.animateTo(0);
                      },
                      child: Obx(
                        () => Container(
                          padding: EdgeInsets.all(getWidth(10)),
                          width: AppSizes.width * 0.5,
                          decoration: BoxDecoration(
                              color: controller.selectedIndex.value == 0
                                  ? AppColors.primaryColor.withOpacity(0.3)
                                  : null,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: controller.selectedIndex.value == 0
                                      ? AppColors.primaryColor
                                      : AppColors.grey)),
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
                      )),
                  GestureDetector(
                      onTap: () {
                        controller.selectedIndex.value = 1;
                        controller.tabController.animateTo(1);
                      },
                      child: Obx(
                        () => Container(
                          padding: EdgeInsets.all(getWidth(10)),
                          width: AppSizes.width * 0.5,
                          decoration: BoxDecoration(
                              color: controller.selectedIndex.value == 1
                                  ? AppColors.primaryColor.withOpacity(0.3)
                                  : null,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: controller.selectedIndex.value == 1
                                      ? AppColors.primaryColor
                                      : AppColors.grey)),
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
                      )),
                ],
              ),
            ),
            pinned: true,
          ),
        ],
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                controller: controller.tabController,
                children: [
                  // Tab 1 :
                  ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(getWidth(16)),
                        child: GestureDetector(
                            onTap: () {
                              Get.to(() => DeliveryDetailsScreen());
                            },
                            child: MyTripCard()),
                      );
                    },
                  ),
                  // Tab 2
                  ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(getWidth(16)),
                        child: GestureDetector(
                            onTap: () {}, child: AsTravellerCard()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _TabBarDelegate(this.tabBar);

  @override
  double get minExtent => tabBar.preferredSize.height;
  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Material(
      color: AppColors.white,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
