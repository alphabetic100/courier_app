import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/icon_path.dart';
import 'package:courierapp/features/my_trip/controller/my_trip_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AsTravellerCard extends StatelessWidget {
  AsTravellerCard(
      {super.key,
      required this.from,
      required this.to,
      required this.price,
      required this.availableSpace,
      required this.status});
  final MyTripController myTripController = Get.find<MyTripController>();
  final String from;
  final String to;
  final String price;
  final String availableSpace;
  final String status;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getWidth(16)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: AppColors.grey.withOpacity(0.8)),
          color: Color(0xFFFAFAFC)),
      child: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Row(
              children: [
                Image.asset(
                  IconPath.destn,
                  height: getHeight(55),
                ),
                HorizontalSpace(width: getWidth(10)),
                SizedBox(
                  height: getHeight(58),
                  width: AppSizes.width * 0.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: from,
                        color: AppColors.black,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                      CustomText(
                        text: to,
                        color: AppColors.black,
                        textOverflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomText(
                      text: "\$$price/kg",
                      color: AppColors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: getWidth(24),
                    ),
                    if (availableSpace.isNotEmpty) ...[
                      if (availableSpace == "Unlimited") ...[
                        VerticalSpace(height: getHeight(5)),
                        CustomText(
                          text: "Available: $availableSpace",
                          fontSize: getWidth(15),
                          fontWeight: FontWeight.normal,
                        )
                      ] else if (availableSpace == "0") ...[
                        VerticalSpace(height: getHeight(5)),
                        CustomText(
                          text: "Full",
                          fontSize: getWidth(15),
                          fontWeight: FontWeight.normal,
                          color: AppColors.error,
                        )
                      ] else ...[
                        VerticalSpace(height: getHeight(5)),
                        CustomText(
                          text: "Available: $availableSpace kg",
                          fontSize: getWidth(15),
                          fontWeight: FontWeight.normal,
                        )
                      ]
                    ]
                  ],
                )
              ],
            ),
          ),
          VerticalSpace(height: getHeight(10)),
          Divider(
            color: AppColors.grey.withOpacity(0.8),
          ),
          VerticalSpace(height: getWidth(10)),
          Padding(
            padding: EdgeInsets.only(left: getWidth(8)),
            child: Row(
              children: [
                CustomText(
                  text: "Status:",
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: getWidth(15),
                ),
                HorizontalSpace(width: getWidth(5)),
                CustomText(
                  text: status,
                  color: status.contains("Pending")
                      ? AppColors.warning
                      : status.contains("No Request")
                          ? AppColors.primaryColor
                          : status.contains("Fully Booked")
                              ? AppColors.error
                              : Colors.black,
                  fontSize: getWidth(15),
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
