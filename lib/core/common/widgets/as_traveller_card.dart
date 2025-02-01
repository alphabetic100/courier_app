import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/icon_path.dart';
import 'package:courierapp/features/my_trip/controller/my_trip_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AsTravellerCard extends StatelessWidget {
  AsTravellerCard({super.key});
  final MyTripController myTripController = Get.find<MyTripController>();
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
          Padding(
            padding: EdgeInsets.only(left: getWidth(8)),
            child: Row(
              children: [
                CustomText(
                  text: "Status:",
                  color: AppColors.black,
                  fontWeight: FontWeight.w400,
                ),
                HorizontalSpace(width: getWidth(5)),
                CustomText(
                  text: myTripController.status.value,
                  color: myTripController.status.value == "Active"
                      ? AppColors.success
                      : AppColors.error,
                  fontSize: getWidth(14),
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
