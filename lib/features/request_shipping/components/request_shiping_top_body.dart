import 'dart:developer';

import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/icon_path.dart';
import 'package:courierapp/core/utils/constants/image_path.dart';
import 'package:courierapp/features/request_shipping/controller/request_shipping_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestShippingTopBody extends StatelessWidget {
  RequestShippingTopBody({
    super.key,
    required this.title,
    required this.departingFrom,
    required this.arrivingTo,
    required this.price,
    required this.date,
  });

  final String title;
  final String departingFrom;
  final String arrivingTo;
  final String price;
  final String date;

  final RequestShippingController shippingController =
      Get.put(RequestShippingController());
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
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: getWidth(16),
          ),
          alignment: Alignment.topLeft,
          child: CustomText(
            text: date,
            color: Color(0xFF677674),
            fontSize: getWidth(19),
            fontWeight: FontWeight.normal,
          ),
        ),
        VerticalSpace(height: getHeight(10)),
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
              Obx(
                () => CustomText(
                  text:
                      "\$${(int.parse(price.replaceAll("\$", "")) * (shippingController.selectedItems.length))}",
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: getWidth(25),
                ),
              ),
              Obx(
                () => CustomText(
                  text:
                      "\$${(int.parse(price.replaceAll("\$", "")))}/kg ${(shippingController.selectedItems.length)}",
                  fontWeight: FontWeight.w400,
                ),
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
