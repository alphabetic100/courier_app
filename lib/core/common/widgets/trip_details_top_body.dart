import 'dart:developer';

import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/icon_path.dart';
import 'package:courierapp/core/utils/constants/image_path.dart';
import 'package:flutter/material.dart';

class TripDetailsTopBody extends StatelessWidget {
  const TripDetailsTopBody({
    super.key,
    required this.title,
    required this.departingFrom,
    required this.arrivingTo,
  });

  final String title;
  final String departingFrom;
  final String arrivingTo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Color(0xFFFAFAFC),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VerticalSpace(height: getHeight(10)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
                child: CustomText(
                  text: title,
                  fontSize: getWidth(25),
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              VerticalSpace(height: getHeight(20)),
              Container(
                height: getHeight(1),
                width: double.infinity,
                color: Color(0xffCCD9D6),
              )
            ],
          ),
        ),
        VerticalSpace(height: getHeight(20)),
        Padding(
          padding: EdgeInsets.only(left: getWidth(16), right: getWidth(16)),
          child: SizedBox(
            width: AppSizes.width,
            child: SizedBox(
              width: AppSizes.width,
              child: Row(
                children: [
                  Image.asset(
                    IconPath.destn,
                    height: getHeight(60),
                  ),
                  HorizontalSpace(width: getWidth(20)),
                  SizedBox(
                    height: getHeight(60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: departingFrom,
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomText(
                          text: arrivingTo,
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    height: getHeight(60),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            log("Tapped");
                            //TODO: Will open gootle map
                          },
                          child: Image.asset(
                            ImagePath.location,
                            height: getHeight(20),
                            color: AppColors.primaryColor,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            log("Tapped");
                          },
                          child: Image.asset(
                            ImagePath.location,
                            height: getHeight(20),
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        VerticalSpace(height: getHeight(20)),
        Container(
          height: getHeight(1),
          width: double.infinity,
          color: Color(0xffCCD9D6),
        ),
        VerticalSpace(height: getHeight(20)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: "\$24",
                color: AppColors.black,
                fontWeight: FontWeight.bold,
                fontSize: getWidth(25),
              ),
              CustomText(
                text: "\$12/kg×2",
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
        ),
        VerticalSpace(height: getHeight(20)),
        Container(
          height: getHeight(1),
          width: double.infinity,
          color: Color(0xffCCD9D6),
        ),
        VerticalSpace(height: getHeight(18))
      ],
    );
  }
}
