import 'package:courierapp/core/common/widgets/create_trip_top_body.dart';
import 'package:courierapp/core/common/widgets/custom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/custom_text_button.dart';
import 'package:courierapp/core/common/widgets/message_notification_box.dart';
import 'package:courierapp/core/common/widgets/progress_indicator.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/image_path.dart';
import 'package:courierapp/features/messege/presentation/screens/chat_screens.dart';
import 'package:courierapp/features/profile/controller/traveller_profile_controller.dart';
import 'package:courierapp/features/profile/presentation/components/traveller_riview_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TravellerProfileScreen extends StatelessWidget {
  final TravellerProfileController profileController =
      Get.put(TravellerProfileController());

  TravellerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String? userId = Get.arguments;
    if (userId == null) {
      return Scaffold(
        body: Center(child: Text("User ID is missing")),
      );
    }
    profileController.getOthersProfileDetails(userId);
    return Obx(() {
      if (profileController.isLoading.value) {
        WidgetsBinding.instance.addPostFrameCallback((callback) {
          showProgressIndicator();
        });
        return Scaffold(
          body: Center(child: SizedBox.shrink()),
        );
      }

      final user = profileController.othersProfile.value?.data;
      if (user == null) {
        hideProgressIndicator();
        return Scaffold(
          appBar: CustomAppBar(),
          body: Center(child: Text("Profile not available")),
        );
      }
      hideProgressIndicator();
      return Scaffold(
        appBar: CustomAppBar(
          backgroundColor: const Color(0xffFAFAFC),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: getWidth(16)),
              child: MessageNotificationBox(),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CreateTripTopBody(title: "Traveller Information"),
              VerticalSpace(height: getHeight(20)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          backgroundImage: user.profileImage.isNotEmpty
                              ? NetworkImage(user.profileImage)
                              : AssetImage(ImagePath.profile),
                          radius: getWidth(42),
                        ),
                        if (user.isVerified)
                          Positioned(
                            bottom: 0,
                            right: getWidth(0),
                            child: CircleAvatar(
                              radius: getWidth(13),
                              backgroundColor: const Color(0xFF2BCD31),
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: getWidth(15),
                              ),
                            ),
                          ),
                      ],
                    ),
                    VerticalSpace(height: getHeight(8)),
                    CustomText(
                      text: user.fullName,
                      fontSize: getWidth(18),
                      color: AppColors.black,
                      fontWeight: FontWeight.w800,
                    ),
                    VerticalSpace(height: getHeight(5)),
                    Row(
                      children: [
                        const Icon(Icons.star_rounded,
                            color: Color(0xFFFFC934)),
                        CustomText(
                          text: "${user.averageRating.toStringAsFixed(1)}/5",
                          fontWeight: FontWeight.w400,
                          fontSize: getWidth(14),
                        ),
                      ],
                    ),
                    VerticalSpace(height: getHeight(8)),
                    Row(
                      children: [
                        const Icon(Icons.history,
                            color: AppColors.secondaryColor),
                        HorizontalSpace(width: getHeight(16)),
                        CustomText(
                          text:
                              "Member since ${DateFormat("MMMM yyyy").format(DateTime.parse(user.createdAt))}",
                          fontWeight: FontWeight.normal,
                          color: const Color(0xff677674),
                        ),
                      ],
                    ),
                    if (user.isVerified) ...[
                      VerticalSpace(height: getHeight(8)),
                      Row(
                        children: [
                          const Icon(Icons.check_circle_outline,
                              color: AppColors.secondaryColor),
                          HorizontalSpace(width: getHeight(16)),
                          CustomText(
                            text: "Verified Profile",
                            fontWeight: FontWeight.normal,
                            color: const Color(0xff677674),
                          ),
                        ],
                      ),
                    ],
                    VerticalSpace(height: getHeight(8)),
                    Row(
                      children: [
                        const Icon(Icons.calendar_month,
                            color: AppColors.secondaryColor),
                        HorizontalSpace(width: getHeight(16)),
                        CustomText(
                          text:
                              "${user.totalTrips} trips - ${user.totalReviewsWithComments} comments",
                          fontWeight: FontWeight.normal,
                          color: const Color(0xff677674),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              VerticalSpace(height: getHeight(16)),
              Divider(color: Color(0xffCCD9D6), height: 1),
              VerticalSpace(height: getHeight(16)),
              if (user.review.isNotEmpty) ...[
                ListView.builder(
                    itemCount: profileController.showMore.value
                        ? user.review.length
                        : 2,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final review = user.review[index];

                      return TravellerRiviewCard(
                        profileUrl: review.user.profileImage,
                        userName: review.user.fullName,
                        ratting: "${review.rating}/5",
                        review: review.comment,
                      );
                    }),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
                  child: CustomTextButton(
                    onPressed: () {
                      profileController.showMore.value =
                          !profileController.showMore.value;
                    },
                    text: profileController.showMore.value
                        ? "Show less"
                        : "Show More",
                    isUnderline: true,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ] else ...[
                Center(
                    child: CustomText(
                  text: "Traveller has no reviews",
                  fontWeight: FontWeight.normal,
                ))
              ],
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomButton(
                  isPrimary: false,
                  color: const Color(0xffFAFAFC),
                  onPressed: () {
                    Get.to(() => ChatInboxScreen(
                          user2ndId: user.id,
                          profileImage: user.profileImage,
                          userName: user.fullName,
                        ));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(CupertinoIcons.bubble_left,
                          color: AppColors.grey),
                      HorizontalSpace(width: getWidth(5)),
                      const CustomText(
                        text: "Chat With Traveller",
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: getWidth(16)),
                child: CustomTextButton(
                  onPressed: () {},
                  text: "Report This Account",
                  isUnderline: true,
                  fontWeight: FontWeight.w600,
                  color: AppColors.error,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
