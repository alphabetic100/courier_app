import 'package:courierapp/core/common/widgets/body_profile_card.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/icon_path.dart';
import 'package:courierapp/core/utils/constants/image_path.dart';
import 'package:flutter/material.dart';

class MyTripCard extends StatelessWidget {
  const MyTripCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getWidth(12)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.grey.withOpacity(0.8)),
          color: Color(0xFFCCD9D6).withOpacity(0.1)),
      child: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Row(
              children: [
                HorizontalSpace(width: getWidth(10)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Laptop to New York",
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    Row(
                      children: [
                        CustomText(
                          text: "Status:",
                          color: AppColors.black,
                          fontWeight: FontWeight.w400,
                        ),
                        HorizontalSpace(width: getWidth(5)),
                        CustomText(
                          text: "Awaiting confirmation",
                          color: AppColors.secondaryColor,
                          fontWeight: FontWeight.normal,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          VerticalSpace(height: getHeight(10)),
          Divider(
            color: AppColors.grey.withOpacity(0.8),
          ),
          BodyProfileCard(
            isVerified: true,
            profileImage: ImagePath.profile,
            profileName: "Albert Flores",
            rattings: "4.8/5",
            suffixIcon: SizedBox(
              width: AppSizes.width * 0.4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomText(
                    text: "DL-88372",
                    color: AppColors.grey,
                    fontSize: getWidth(14),
                    fontWeight: FontWeight.w400,
                  ),
                  HorizontalSpace(width: getWidth(10)),
                  Image.asset(
                    IconPath.directionsBus,
                    height: getHeight(25),
                    color: AppColors.grey,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
