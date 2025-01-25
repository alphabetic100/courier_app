import 'package:courierapp/core/common/widgets/custom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/message_notification_box.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/icon_path.dart';
import 'package:courierapp/core/utils/constants/image_path.dart';
import 'package:courierapp/features/request_shipping/components/item_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RequestShippingScreen extends StatelessWidget {
  const RequestShippingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(
                right: getWidth(12), top: getHeight(6), bottom: getHeight(6)),
            child: MessageNotificationBox(),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VerticalSpace(height: getHeight(10)),
              CustomText(
                text: "Trip Overview",
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
                                //TODO: Will open gootle map
                              },
                              child: Image.asset(
                                ImagePath.location,
                                height: getHeight(20),
                                color: AppColors.secondaryColor,
                              ),
                            ),
                            GestureDetector(
                              child: Image.asset(
                                ImagePath.location,
                                height: getHeight(20),
                                color: AppColors.secondaryColor,
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
              ItemDetails(),
              VerticalSpace(height: getHeight(20)),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: AppSizes.height * 0.13,
        padding: EdgeInsets.symmetric(horizontal: getWidth(12)),
        color: AppColors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  CupertinoIcons.cube_box,
                  color: AppColors.secondaryColor,
                ),
                HorizontalSpace(width: getWidth(10)),
                Expanded(
                  child: CustomText(
                    text:
                        "Your shipment will be confirmed once the traveller accepts the request.",
                    fontWeight: FontWeight.normal,
                  ),
                )
              ],
            ),
            CustomButton(
                onPressed: () {},
                child: CustomText(
                  text: "Next",
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ))
          ],
        ),
      ),
    );
  }
}
