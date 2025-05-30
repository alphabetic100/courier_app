import 'package:courierapp/core/common/widgets/custom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/message_notification_box.dart';
import 'package:courierapp/core/common/widgets/progress_indicator.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/icon_path.dart';
import 'package:courierapp/core/utils/constants/image_path.dart';
import 'package:courierapp/core/utils/helpers/app_helper.dart';
import 'package:courierapp/features/profile/controller/profile_controller.dart';
import 'package:courierapp/features/profile/presentation/components/profile_details_card.dart';
import 'package:courierapp/features/profile/presentation/components/profile_trip_travel_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../core/common/widgets/custom_button_widgets.dart';
import '../../../landing/controller/landing_controller.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final LandingController landingController = Get.find<LandingController>();

  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    //controller.getProfileDetails();

    return Obx(() {
      if (controller.isLoading.value) {
        WidgetsBinding.instance.addPostFrameCallback((callback) {
          showProgressIndicator();
        });
        return Scaffold();
      } else {
        hideProgressIndicator();
        return Scaffold(
          appBar: CustomAppBar(
            ontapBackButton: () {
              landingController.changePage(0);
            },
            actions: [
              Padding(
                padding: EdgeInsets.only(
                  right: getWidth(16),
                ),
                child: MessageNotificationBox(),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Color(0xffFAFAFC),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VerticalSpace(height: getHeight(20)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
                        child: CustomText(
                          text: "Profile",
                          fontSize: getWidth(25),
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      VerticalSpace(height: getHeight(20)),
                      Divider(
                        height: getHeight(1),
                        color: Color(0xffCCD9D6),
                      ),
                    ],
                  ),
                ),
                VerticalSpace(height: getHeight(20)),
                Obx(() {
                  final profile = controller.profile.value?.data;
                  final String? profileImage = profile?.profileImage;
                  final bool hasValidProfileImage =
                      profileImage != null && profileImage.isNotEmpty;
                  if (profile == null) {
                    return Scaffold();
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                CircleAvatar(
                                  backgroundImage: hasValidProfileImage
                                      ? NetworkImage(profileImage)
                                      : AssetImage(ImagePath.profile)
                                          as ImageProvider,
                                  radius: getWidth(50),
                                ),
                                profile.isVerified
                                    ? Positioned(
                                        bottom: 0,
                                        right: getWidth(10),
                                        child: CircleAvatar(
                                          radius: getWidth(15),
                                          backgroundColor: Color(0xFF2BCD31),
                                          child: Icon(
                                            Icons.check,
                                            color: Colors.white,
                                            size: getWidth(15),
                                          ),
                                        ))
                                    : SizedBox.shrink(),
                              ],
                            ),
                            VerticalSpace(height: getHeight(10)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: profile.fullName.toString(),
                                      fontSize: getWidth(20),
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.black,
                                    ),
                                    CustomText(
                                      text:
                                          "Member since ${DateFormat('MMMM yyyy').format(profile.createdAt)}",
                                      fontSize: getWidth(14),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ],
                                ),
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            contentPadding:
                                                EdgeInsets.all(getHeight(25)),
                                            content: CustomText(
                                                textAlign: TextAlign.center,
                                                text:
                                                    "Are you sure you want to logout?",
                                                fontSize: getWidth(20),
                                                color: Color(0xFF0D0D0C),
                                                fontWeight: FontWeight.w600),
                                            actions: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  CustomButtonV2(
                                                      width: getWidth(120),
                                                      color: Color(0xFFC2C2C2),
                                                      onTap: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: CustomText(
                                                        text: "No",
                                                        fontSize: getWidth(14),
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      )),
                                                  CustomButtonV2(
                                                      width: getWidth(120),
                                                      color: Color(0xFFFF1717),
                                                      onTap: () {
                                                        controller.logOut();
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: CustomText(
                                                        text: "Yes",
                                                        fontSize: getWidth(14),
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Colors.white,
                                                      ))
                                                ],
                                              )
                                            ],
                                          );
                                        });
                                  },
                                  icon: Icon(
                                    Icons.logout,
                                    color: Colors.red,
                                    size: 23,
                                  ),
                                )
                              ],
                            ),
                            VerticalSpace(height: getHeight(16)),
                          ],
                        ),
                      ),
                      Divider(
                        height: getHeight(1),
                        color: Color(0xffCCD9D6),
                      ),
                      VerticalSpace(height: getHeight(10)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
                        child: SizedBox(
                          width: AppSizes.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ProfileDetailsCard(
                                      title: "Name:",
                                      subtitle: profile.fullName.toString()),
                                  ProfileDetailsCard(
                                      title: "Phone:",
                                      subtitle: profile.phoneNumber),
                                  ProfileDetailsCard(
                                      title: "Email:", subtitle: profile.email),
                                  ProfileDetailsCard(
                                      title: "Password:",
                                      subtitle:
                                          profile.passwordUpdatedAt != null
                                              ? AppHelperFunctions.timeAgo(
                                                  profile.passwordUpdatedAt!)
                                              : "Not updated yet"),
                                  ProfileDetailsCard(
                                    title: "Verification status:",
                                    subtitle: profile.isVerified == true
                                        ? "Verified"
                                        : "Not Verified",
                                    color: AppColors.secondaryColor,
                                  )
                                ],
                              ),
                              IconButton(
                                  onPressed: () {
                                    Get.to(() => EditProfileScreen(),
                                        arguments: {
                                          'imagePath': profile.profileImage,
                                          'fullName': profile.fullName,
                                          'phoneNumber': profile.phoneNumber,
                                          "emailAddress": profile.email,
                                          "password": profile
                                                      .passwordUpdatedAt !=
                                                  null
                                              ? AppHelperFunctions.timeAgo(
                                                  profile.passwordUpdatedAt!)
                                              : "Not updated yet",
                                          "verification":
                                              profile.isVerified.toString(),
                                        },
                                        curve: Curves.easeInOut);
                                  },
                                  icon: Image.asset(
                                    IconPath.editSquare,
                                    color: AppColors.primaryColor,
                                    height: getHeight(20),
                                  ))
                            ],
                          ),
                        ),
                      ),
                      VerticalSpace(height: getHeight(20)),
                      Divider(
                        height: getHeight(1),
                        color: Color(0xffCCD9D6),
                      ),
                      VerticalSpace(height: getHeight(20)),
                      Padding(
                        padding: EdgeInsets.only(
                            left: getWidth(20), right: getHeight(20)),
                        child: Column(
                          children: [
                            SizedBox(
                              width: AppSizes.width,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ProfileTripTravelBox(
                                      title: "Trips as Traveler",
                                      amount: controller
                                              .totalTripsas.value.isNotEmpty
                                          ? controller.totalTripsas.value
                                          : "0"),
                                  HorizontalSpace(width: getWidth(20)),
                                  ProfileTripTravelBox(
                                      title: "Deliveries as Sender",
                                      amount: controller
                                              .totalDelivery.value.isNotEmpty
                                          ? controller.totalDelivery.value
                                          : "0"),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: getHeight(16),
                            ),
                            ProfileTripTravelBox(
                              title: "carbon emissions reduced",
                              amount: controller.carbonEmission.value.isNotEmpty
                                  ? controller.carbonEmission.value
                                  : "XXXX",
                              color: AppColors.success,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                })
              ],
            ),
          ),
        );
      }
    });
  }
}
