import 'package:courierapp/core/common/widgets/body_profile_card.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/icon_path.dart';
import 'package:courierapp/features/search_screen/models/all_trip_model.dart';
import 'package:courierapp/features/search_screen/presentation/screens/trip_overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchResultCard extends StatelessWidget {
  const SearchResultCard(
      {super.key,
      required this.from,
      required this.to,
      required this.price,
      required this.availableSpace,
      required this.profileUrl,
      required this.profileRetting,
      required this.carNumber,
      required this.trynasportType,
      required this.profileName,
      required this.isVerified,
      required this.trip});

  final String from;
  final String to;
  final String price;
  final String availableSpace;
  final String profileUrl;
  final String profileName;
  final String profileRetting;
  final String carNumber;
  final String trynasportType;
  final bool isVerified;
  final TransportData trip;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => TripOverviewScreen(
              trip: trip,
            ));
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
                        text: from,
                        color: AppColors.black,
                      ),
                      CustomText(
                        text: to,
                        color: AppColors.black,
                      )
                    ],
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
                      if (availableSpace == "0") ...[
                        VerticalSpace(height: getHeight(5)),
                        CustomText(
                          text: "Full",
                          color: AppColors.error,
                          fontSize: getWidth(14),
                        )
                      ],
                      if (availableSpace == "unlimited") ...[
                        VerticalSpace(height: getHeight(5)),
                        CustomText(
                          text: "Available: Unlimited",
                          fontWeight: FontWeight.normal,
                          fontSize: getWidth(14),
                        )
                      ] else ...[
                        VerticalSpace(height: getHeight(5)),
                        CustomText(
                          text: "Available: $availableSpace kg",
                          fontWeight: FontWeight.normal,
                          fontSize: getWidth(14),
                        )
                      ],
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
              isVerified: isVerified,
              profileImage: profileUrl,
              profileName: profileName,
              rattings: profileRetting,
              carNumber: carNumber,
              suffixIcon: trynasportType.toLowerCase() == "bus"
                  ? Image.asset(
                      IconPath.directionsBus,
                      height: getHeight(25),
                      color: AppColors.grey,
                    )
                  : trynasportType.toLowerCase() == "car"
                      ? Image.asset(
                          IconPath.car,
                          height: getHeight(25),
                          color: AppColors.grey,
                        )
                      : trynasportType.toLowerCase() == "airplane"
                          ? Image.asset(
                              IconPath.plane,
                              height: getHeight(25),
                              color: AppColors.grey,
                            )
                          : Image.asset(
                              IconPath.train,
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
