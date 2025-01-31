import 'package:courierapp/core/common/widgets/create_trip_top_body.dart';
import 'package:courierapp/core/common/widgets/custom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/custom_text_button.dart';
import 'package:courierapp/core/common/widgets/message_notification_box.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/image_path.dart';
import 'package:courierapp/features/chat_with_traveller/presentation/chat_with_traveller_screen.dart';
import 'package:courierapp/features/profile/presentation/components/traveller_riview_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TravellerInformation extends StatelessWidget {
  const TravellerInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: Color(0xffFAFAFC),
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
            CreateTripTopBody(title: "Traveller Information"),
            VerticalSpace(height: getHeight(20)),
            Padding(
              padding:  EdgeInsets.only(left: getWidth(16), right: getWidth(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(ImagePath.profile),
                        radius: getWidth(42),
                      ),
                      Positioned(
                          bottom: 0,
                          right: getWidth(0),
                          child: CircleAvatar(
                            radius: getWidth(13),
                            backgroundColor: Color(0xFF2BCD31),
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                              size: getWidth(15),
                            ),
                          )),
                    ],
                  ),
                  VerticalSpace(height: getHeight(8)),
                  CustomText(
                    text: "Albert Flores",
                    fontSize: getWidth(18),
                    color: AppColors.black,
                    fontWeight: FontWeight.w800,
                  ),
                  Row(
                    children: [
                      Icon(Icons.star_rounded, color: Color(0xFFFFC934)),
                      CustomText(
                        text: "4.8/5",
                        fontWeight: FontWeight.w400,
                        fontSize: getWidth(14),
                      ),
                    ],
                  ),
                  VerticalSpace(height: getHeight(16)),
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                              height: getHeight(25),
                              width: getWidth(20),
                              child: Icon(
                                Icons.history,
                                color: AppColors.secondaryColor,
                              )),
                          HorizontalSpace(width: getHeight(16)),
                          CustomText(
                            text: "Member since March 2022",
                            fontWeight: FontWeight.normal,
                            color: Color(0xff677674),
                          ),
                        ],
                      ),
                      VerticalSpace(height: getHeight(10)),
                      Row(
                        children: [
                          SizedBox(
                            height: getHeight(20),
                            width: getWidth(20),
                            child: Image.asset(
                              "assets/icons/check_circle.png",
                              fit: BoxFit.fill,
                              color: AppColors.secondaryColor,
                            ),
                          ),
                          HorizontalSpace(width: getHeight(16)),
                          CustomText(
                            text: "Verified Profile",
                            fontWeight: FontWeight.normal,
                            color: Color(0xff677674),
                          ),
                        ],
                      ),
                      VerticalSpace(height: getHeight(10)),
                      Row(
                        children: [
                          SizedBox(
                              height: getHeight(20),
                              width: getWidth(20),
                              child: Icon(
                                Icons.message_outlined,
                                color: AppColors.secondaryColor,
                                size: getHeight(25),
                              )),
                          HorizontalSpace(width: getHeight(16)),
                          CustomText(
                            text: "10 trips - 7 comments",
                            fontWeight: FontWeight.normal,
                            color: Color(0xff677674),
                          ),
                        ],
                      ),
                      VerticalSpace(height: getHeight(10)),
                    ],
                  ),
                ],
              ),
            ),
            // builtDetail(
            //     isSub: false,
            //     title: 'Member since March 2022',
            //     icon: Icon(
            //       Icons.history,
            //       size: 25,
            //       color: AppColors.secondaryColor,
            //     )),
            // builtDetail(
            //     isSub: false,
            //     title: 'Verified Profile',
            //     icon: Image.asset(
            //       "assets/icons/check_circle.png",
            //       fit: BoxFit.fill,
            //     )),
            // builtDetail(
            //   isSub: false,
            //   title: "10 trips - 7 comments",
            //   icon: Icon(
            //     Icons.message,
            //     color: AppColors.secondaryColor,
            //   ),
            // ),
            VerticalSpace(height: getHeight(16)),
            Divider(
              color: Color(0xffCCD9D6),
              height: getHeight(1),
            ),
            VerticalSpace(height: getHeight(16)),
            TravellerRiviewCard(
                profileUrl: ImagePath.profile,
                userName: "Darrell Steward",
                ratting: "4/5",
                review:
                    "kept me updated throughout the delivery process. Everything went smoothly"),
            TravellerRiviewCard(
                profileUrl: ImagePath.profile,
                userName: "Mark Wilson",
                ratting: "5/5",
                review:
                    "Delivery was a little late, but he communicated well and ensured the package arrived safely."),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomTextButton(
                onPressed: () {},
                text: "Show more",
                isUnderline: true,
                fontWeight: FontWeight.w600,
                fontSize: getWidth(16),
                color: Color(0xff003087),
              ),
            ),
            Divider(
              color: Color(0xffCCD9D6),
              height: getHeight(1),
            ),
            
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomButton(
                  isPrimary: false,
                color: Color(0xffFAFAFC),
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
                        text: "Chat With Traveller",
                        fontWeight: FontWeight.bold,
                      )
                    ],
                  )),
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
            )
          ],
        ),
      ),
    );
  }
}
