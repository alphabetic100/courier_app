import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/icon_path.dart';
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
                        fontSize: getWidth(20),
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
            ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: Stack(
                children: [
                  CircleAvatar(),
                  tripOverviewController.isVerified.value
                      ? Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            backgroundColor: AppColors.secondaryColor,
                            radius: getWidth(10),
                            child: Icon(
                              Icons.check,
                              size: getHeight(15),
                              color: Colors.white,
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                ],
              ),
              title: CustomText(
                text: "Albert Flores",
                color: AppColors.black,
              ),
              subtitle: Row(
                children: [
                  Icon(Icons.star_rounded, color: Color(0xFFFFC934)),
                  Text("4.8/5"),
                ],
              ),
              trailing: Image.asset(
                IconPath.directionsBus,
                height: getHeight(35),
              ),
            )
          ],
        ),
      ),
    );
  }
}
