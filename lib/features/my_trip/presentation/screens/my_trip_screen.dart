import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/message_notification_box.dart';
import 'package:courierapp/core/common/widgets/my_trip_card.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/features/my_trip/controller/my_trip_controller.dart';
import 'package:courierapp/features/search_screen/presentation/components/search_result_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTripScreen extends StatelessWidget {
  const MyTripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MyTripController controller = Get.put(MyTripController());

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
                    Get.back();
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
        ],
        body: Column(
          children: [
            TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Color(0xFF0057B7),
              unselectedLabelColor: AppColors.black,
              dividerColor: Colors.transparent,
              indicator: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Color(0xFF0057B7),
                width: 2,
              ))),
              controller: controller.tabController,
              tabs: [
                Container(
                  padding: EdgeInsets.all(getWidth(10)),
                  width: AppSizes.width * 0.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.primaryColor)),
                  child: Center(
                    child: CustomText(
                      text: "As Sender",
                      fontSize: getWidth(16),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(getWidth(10)),
                  width: AppSizes.width * 0.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.primaryColor)),
                  child: Center(
                    child: CustomText(
                      text: "As Traveller",
                      fontSize: getWidth(16),
                    ),
                  ),
                ),
              ],
            ),
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
                        child: SearchResultCard(),
                      );
                    },
                  ),
                  //TAb: 2
                  ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(getWidth(16)),
                        child: MyTripCard(),
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
