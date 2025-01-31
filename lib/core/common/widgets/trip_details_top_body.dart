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
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VerticalSpace(height: getHeight(10)),
        CustomText(
          text: title,
          fontSize: getWidth(25),
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
        VerticalSpace(height: getHeight(20)),
        Divider(
          color: AppColors.grey,
        ),
        VerticalSpace(height: getHeight(20)),
        SizedBox(
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
                        text: "32,C.nuñez de balboa, Madrid",
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      CustomText(
                        text: "3, Rue des Invalides, Paris",
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
        VerticalSpace(height: getHeight(20)),
        Divider(
          color: AppColors.grey,
        ),
        VerticalSpace(height: getHeight(20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: "\$24",
              color: AppColors.black,
              fontWeight: FontWeight.bold,
              fontSize: getWidth(25),
            ),
            CustomText(text: "\$12/kg×2"),
          ],
        ),
        VerticalSpace(height: getHeight(20)),
        Divider(
          color: AppColors.grey,
        ),
        VerticalSpace(height: getHeight(20)),
      ],
    );
  }
}
