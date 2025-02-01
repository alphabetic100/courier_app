import 'package:courierapp/core/common/widgets/body_profile_card.dart';
import 'package:courierapp/core/common/widgets/custom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_bottom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/message_notification_box.dart';
import 'package:courierapp/core/common/widgets/trip_details_top_body.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/image_path.dart';
import 'package:courierapp/features/chat_with_traveller/presentation/chat_with_traveller_screen.dart';
import 'package:courierapp/features/profile/presentation/screens/others_profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryDetailsScreen extends StatelessWidget {
  const DeliveryDetailsScreen({super.key});

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
            TripDetailsTopBody(title: "Delivery Details"),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
              child: Column(
                children: [
                  Row(
                    children: [
                      CustomText(
                        text: "Item name:",
                        fontSize: getWidth(14),
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                      HorizontalSpace(width: getWidth(5)),
                      Expanded(
                        child: CustomText(
                          text: "Laptop to New York",
                          fontSize: getWidth(14),
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      CustomText(
                        text: "Item description:",
                        fontSize: getWidth(14),
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                      HorizontalSpace(width: getWidth(5)),
                      Expanded(
                        child: CustomText(
                          text:
                              "A laptop computer for work. Model- Lenovo Legion.",
                          fontSize: getWidth(14),
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      CustomText(
                        text: "Status:",
                        fontSize: getWidth(14),
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                      HorizontalSpace(width: getWidth(5)),
                      Expanded(
                        child: CustomText(
                          text: "Traveller has accepted the delivery request.",
                          fontSize: getWidth(14),
                          fontWeight: FontWeight.normal,
                          color: AppColors.secondaryColor,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            VerticalSpace(height: getHeight(20)),
            Divider(
              color: AppColors.grey,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
              child: GestureDetector(
                onTap: () {
                  Get.to(() => OthersProfileScreen());
                },
                child: BodyProfileCard(
                    isVerified: true,
                    profileImage: ImagePath.profile,
                    profileName: "profileName",
                    rattings: "5.00/6",
                    suffixIcon: Icon(Icons.arrow_forward_ios)),
              ),
            ),
            Divider(
              color: AppColors.grey,
            ),
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
                        text: "Chat",
                        fontWeight: FontWeight.bold,
                        fontSize: getWidth(18),
                      )
                    ],
                  )),
            ),
            HorizontalSpace(width: getWidth(16)),
            Expanded(
              child: CustomButton(
                  isPrimary: false,
                  onPressed: () {
                    // Get.to(() => ChatWithTravellerScreen());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icons/track.png",
                        color: AppColors.grey,
                        height: getHeight(28),
                      ),
                      HorizontalSpace(width: getWidth(5)),
                      CustomText(
                        text: "Trak",
                        fontWeight: FontWeight.bold,
                        fontSize: getWidth(18),
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
