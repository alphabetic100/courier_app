import 'package:courierapp/core/common/widgets/custom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/message_notification_box.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/icon_path.dart';
import 'package:courierapp/core/utils/constants/image_path.dart';
import 'package:courierapp/features/search_screen/controller/trip_overview_controller.dart';
import 'package:courierapp/features/search_screen/presentation/components/trip_overview_details.dart';
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
            padding: EdgeInsets.only(
                right: getWidth(12), top: getWidth(6), bottom: getWidth(6)),
            child: MessageNotificationBox(),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getWidth(12)),
        child: Column(
          children: [
            VerticalSpace(height: getHeight(10)),
            CustomText(
              text: "Trip Overview",
              fontSize: getWidth(25),
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
            VerticalSpace(height: getHeight(20)),
            Divider(
              color: AppColors.grey,
            ),
            VerticalSpace(height: getHeight(20)),
            SizedBox(
              width: AppSizes.width,
              child: SizedBox(
                width: AppSizes.width,
                child: Row(
                  children: [
                    Image.asset(
                      IconPath.destn,
                      height: getHeight(60),
                    ),
                    HorizontalSpace(width: getWidth(20)),
                    SizedBox(
                      height: getHeight(60),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "32,C.nuñez de balboa, Madrid",
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          CustomText(
                            text: "3, Rue des Invalides, Paris",
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    SizedBox(
                      height: getHeight(60),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              //TODO: Will open gootle map
                            },
                            child: Image.asset(
                              ImagePath.location,
                              height: getHeight(20),
                              color: AppColors.secondaryColor,
                            ),
                          ),
                          GestureDetector(
                            child: Image.asset(
                              ImagePath.location,
                              height: getHeight(20),
                              color: AppColors.secondaryColor,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            VerticalSpace(height: getHeight(20)),
            Divider(
              color: AppColors.grey,
            ),
            VerticalSpace(height: getHeight(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "\$24",
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: getWidth(25),
                ),
                CustomText(text: "\$12/kg×2"),
              ],
            ),
            VerticalSpace(height: getHeight(20)),
            Divider(
              color: AppColors.grey,
            ),
            VerticalSpace(height: getHeight(20)),
            TripOverviewDetails(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: AppSizes.height * 0.135,
        padding: EdgeInsets.symmetric(
            horizontal: getHeight(12), vertical: getHeight(10)),
        color: AppColors.white,
        child: Column(
          children: [
            CustomButton(
                isPrimary: false,
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.message_outlined,
                      color: AppColors.grey,
                    ),
                    HorizontalSpace(width: getWidth(5)),
                    CustomText(
                      text: "Chat With Traveller",
                      fontWeight: FontWeight.bold,
                    )
                  ],
                )),
            VerticalSpace(height: getHeight(10)),
            CustomButton(
                isPrimary: true,
                onPressed: () {},
                child: CustomText(
                  text: "Request Shipping",
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ))
          ],
        ),
      ),
    );
  }
}
