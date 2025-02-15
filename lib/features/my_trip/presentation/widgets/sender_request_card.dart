import 'package:courierapp/core/common/widgets/body_profile_card.dart';
import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/features/my_trip/presentation/widgets/sender_request_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SenderRequestCard extends StatelessWidget {
  const SenderRequestCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => SenderRequestDetailsScreen());
      },
      child: Container(
        padding: EdgeInsets.all(getWidth(16)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.grey.withOpacity(0.5))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BodyProfileCard(
                isVerified: true,
                profileImage: "",
                profileName: "Albert Tesla",
                subtitle: "Total 32 Trips",
                rattings: 4.22.toString(),
                suffixIcon: CustomText(
                  text: "\$17",
                  color: AppColors.titleTextColor,
                  fontSize: getWidth(24),
                  fontWeight: FontWeight.bold,
                )),
            VerticalSpace(height: getHeight(10)),
            Divider(
              color: AppColors.grey,
            ),
            VerticalSpace(height: getHeight(10)),
            CustomText(
              text: "Laptop to New York (2.5kg)",
              fontWeight: FontWeight.w600,
              color: AppColors.black,
              fontSize: getWidth(15),
            ),
            VerticalSpace(height: getHeight(10)),
            CustomText(
              text:
                  "This is a laptop that i want to send to Paris to my Brother as a gift.",
              fontWeight: FontWeight.normal,
              color: AppColors.bodyTextColor,
              fontSize: getWidth(15),
            ),
            VerticalSpace(height: getHeight(10)),
            Row(
              children: [
                CustomText(
                  text: "Status: ",
                  color: AppColors.titleTextColor,
                  fontWeight: FontWeight.w700,
                ),
                HorizontalSpace(width: getWidth(5)),
                CustomText(
                  text: "Requests Pending",
                  color: AppColors.secondaryColor,
                  fontWeight: FontWeight.normal,
                ),
              ],
            ),
            VerticalSpace(height: getHeight(10)),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                      isPrimary: false,
                      borderColor: AppColors.success,
                      onPressed: () {},
                      child: Icon(
                        Icons.check,
                        color: AppColors.success,
                      )),
                ),
                HorizontalSpace(width: getWidth(10)),
                Expanded(
                  child: CustomButton(
                      isPrimary: false,
                      onPressed: () {},
                      borderColor: AppColors.error,
                      child: Icon(
                        Icons.close,
                        color: AppColors.error,
                      )),
                ),
                // HorizontalSpace(width: getWidth(8)),
                // Expanded(
                //   child: CustomButton(
                //       isPrimary: false,
                //       onPressed: () {
                //         Get.to(() => ChatInboxScreen());
                //       },
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           Icon(
                //             CupertinoIcons.bubble_left,
                //             color: AppColors.grey,
                //           ),
                //           HorizontalSpace(width: getWidth(10)),
                //           CustomText(
                //             text: "Chat With Sender",
                //             fontWeight: FontWeight.bold,
                //           )
                //         ],
                //       )),
                // ),
              ],
            ),
            VerticalSpace(height: getHeight(10)),
          ],
        ),
      ),
    );
  }
}
