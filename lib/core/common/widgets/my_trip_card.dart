import 'package:courierapp/core/common/widgets/body_profile_card.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/icon_path.dart';
import 'package:courierapp/features/my_trip/models/my_bookings_model.dart';
import 'package:flutter/material.dart';

class MyBookingsCard extends StatelessWidget {
  const MyBookingsCard({super.key, required this.booking});
  final BookingData booking;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getWidth(12)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: AppColors.grey.withOpacity(0.8)),
          color: Color(0xFFFAFAFC)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                HorizontalSpace(width: getWidth(10)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: booking.itemName,
                      fontSize: getWidth(17),
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: booking.from.length > 20
                              ? AppSizes.width * 0.3
                              : null,
                          child: CustomText(
                            text: booking.from,
                            fontSize: getWidth(15),
                            color: AppColors.black,
                            fontWeight: FontWeight.w600,
                            textOverflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5, right: 5),
                          child: Image.asset(
                            IconPath.arrow,
                            width: getWidth(28),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        SizedBox(
                          width: AppSizes.width * 0.3,
                          child: CustomText(
                            text: booking.to,
                            fontSize: getWidth(15),
                            color: AppColors.black,
                            fontWeight: FontWeight.w600,
                            textOverflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CustomText(
                          text: "Status:",
                          color: AppColors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        HorizontalSpace(width: getWidth(5)),
                        CustomText(
                          text: booking.status == "pending"
                              ? "Awaiting confirmation"
                              : booking.status == "accepted"
                                  ? "Accepted delivery"
                                  : booking.status == "pickupped"
                                      ? "Picked up by traveller"
                                      : booking.status == "delivered"
                                          ? "Delivered"
                                          : booking.status,
                          color: booking.status == "pending"
                              ? AppColors.warning
                              : booking.status == "accepted" ||
                                      booking.status == "delivered"
                                  ? AppColors.success
                                  : AppColors.secondaryColor,
                          fontWeight: booking.status == "delivered"
                              ? FontWeight.bold
                              : FontWeight.w500,
                          fontSize: getWidth(15),
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
            isVerified: booking.isVerified,
            profileImage: booking.profileImage,
            profileName: booking.fullName,
            rattings: booking.averageRating.toStringAsFixed(1),
            suffixIcon: SizedBox(
              width: AppSizes.width * 0.4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomText(
                    text: booking.transportNumber,
                    color: AppColors.grey,
                    fontSize: getWidth(14),
                    fontWeight: FontWeight.w400,
                  ),
                  HorizontalSpace(width: getWidth(10)),
                  booking.transportType.toLowerCase() == "bus"
                      ? Image.asset(
                          IconPath.directionsBus,
                          height: getHeight(25),
                          color: AppColors.grey,
                        )
                      : booking.transportType.toLowerCase() == "car"
                          ? Image.asset(
                              IconPath.car,
                              height: getHeight(25),
                              color: AppColors.grey,
                            )
                          : booking.transportType.toLowerCase() == "airplane"
                              ? Image.asset(
                                  IconPath.plane,
                                  height: getHeight(25),
                                  color: AppColors.grey,
                                )
                              : booking.transportType.toLowerCase() == "train"
                                  ? Image.asset(
                                      IconPath.train,
                                      height: getHeight(25),
                                      color: AppColors.grey,
                                    )
                                  : SizedBox.shrink()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
