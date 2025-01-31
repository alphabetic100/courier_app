import 'package:courierapp/core/common/widgets/body_profile_card.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/icon_path.dart';
import 'package:courierapp/core/utils/constants/image_path.dart';
import 'package:courierapp/features/search_screen/controller/trip_overview_controller.dart';
import 'package:courierapp/features/search_screen/presentation/screens/trip_overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchResultCard extends StatelessWidget {
  SearchResultCard({super.key});
  final TripOverviewController tripOverviewController =
      Get.find<TripOverviewController>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => TripOverviewScreen());
        // Get.toNamed(AppRoute.tripOverviewScreen);
      },
      child: Container(
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
                  Image.asset(
                    IconPath.destn,
                    height: getHeight(40),
                  ),
                  HorizontalSpace(width: getWidth(10)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "Madrid",
                        color: AppColors.black,
                      ),
                      CustomText(
                        text: "Paris",
                        color: AppColors.black,
                      )
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomText(
                        text: "\$8/kg",
                        color: AppColors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: getWidth(24),
                      ),
                      VerticalSpace(height: getHeight(5)),
                      CustomText(
                        text: "Available: 5 kg",
                        fontSize: getWidth(12),
                      )
                    ],
                  )
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
              suffixIcon: Image.asset(
                IconPath.directionsBus,
                height: getHeight(25),
                color: AppColors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
