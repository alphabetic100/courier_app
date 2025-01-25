import 'package:courierapp/core/common/widgets/custom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/message_notification_box.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/icon_path.dart';
import 'package:courierapp/features/profile/components/profile_details_card.dart';
import 'package:courierapp/features/profile/components/profile_trip_travel_box.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(
                right: getWidth(12), top: getHeight(6), bottom: getHeight(6)),
            child: MessageNotificationBox(),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getWidth(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VerticalSpace(height: getHeight(20)),
              CustomText(
                text: "My Profile",
                fontSize: getWidth(25),
                color: AppColors.black,
                fontWeight: FontWeight.bold,
              ),
              VerticalSpace(height: getHeight(20)),
              Divider(),
              VerticalSpace(height: getHeight(20)),
              Stack(
                children: [
                  CircleAvatar(
                    radius: getWidth(60),
                  ),
                  Positioned(
                      bottom: 0,
                      right: getWidth(10),
                      child: CircleAvatar(
                        radius: getWidth(15),
                        backgroundColor: AppColors.secondaryColor,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: getWidth(15),
                        ),
                      )),
                ],
              ),
              VerticalSpace(height: getHeight(10)),
              CustomText(
                text: "Albert Flores",
                fontSize: getWidth(20),
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
              CustomText(
                text: "Member since March 2022",
                fontSize: getWidth(14),
                fontWeight: FontWeight.normal,
              ),
              VerticalSpace(height: getHeight(10)),
              Divider(),
              VerticalSpace(height: getHeight(10)),
              SizedBox(
                width: AppSizes.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProfileDetailsCard(
                            title: "Name:", subtitle: "Albert Flores"),
                        ProfileDetailsCard(
                            title: "Phone:", subtitle: "+1 123 456 7890"),
                        ProfileDetailsCard(
                            title: "Email:",
                            subtitle: "albertflores334@example.com"),
                        ProfileDetailsCard(
                            title: "Password:",
                            subtitle: "Updated 23 days ago"),
                        ProfileDetailsCard(
                          title: "Verification status:",
                          subtitle: "Verified",
                          color: AppColors.secondaryColor,
                        )
                      ],
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          IconPath.editSquare,
                          color: AppColors.primaryColor,
                          height: getHeight(20),
                        ))
                  ],
                ),
              ),
              VerticalSpace(height: getHeight(20)),
              Divider(
                color: AppColors.grey,
              ),
              VerticalSpace(height: getHeight(20)),
              SizedBox(
                width: AppSizes.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileTripTravelBox(
                        title: "Trips as Traveler", amount: "50"),
                    HorizontalSpace(width: getWidth(20)),
                    ProfileTripTravelBox(
                        title: "Deliveries as Sender", amount: "25"),
                  ],
                ),
              ),
              ProfileTripTravelBox(
                title: "Earnings & Withdrawals",
                amount: "\$1,250.00",
                icon: Image.asset(
                  IconPath.accountBalance,
                  height: getHeight(25),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
