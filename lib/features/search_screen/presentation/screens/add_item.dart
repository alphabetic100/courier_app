import 'package:courierapp/core/common/styles/get_text_style.dart';
import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/message_notification_box.dart';
import 'package:courierapp/core/common/widgets/show_app_logo.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/features/request_shipping/components/item_details.dart';
import 'package:courierapp/features/search_screen/controller/search_screen_controller.dart';
import 'package:courierapp/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddItem extends StatelessWidget {
  AddItem({super.key});
  final SearchScreenController searchScreenController =
      Get.find<SearchScreenController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: AppSizes.height,
          width: AppSizes.width,
          child: Stack(
            children: [
              //Background color mixin
              Column(
                children: [
                  Container(
                    height: AppSizes.height * 0.4,
                    color: AppColors.secondaryColor,
                  ),
                  Expanded(
                    child: Container(
                      color: AppColors.grey.withOpacity(0.2),
                    ),
                  ),
                ],
              ),

              //TopBar in Search screen
              Container(
                height: AppSizes.height * 0.1,
                color: AppColors.white,
                child: Column(
                  children: [
                    VerticalSpace(height: getHeight(16)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: getWidth(6),
                              top: getWidth(6),
                              bottom: getWidth(6)),
                          child: CustomButton(
                              isPrimary: false,
                              onPressed: () {
                                Get.back();
                              },
                              child: Center(
                                child: Icon(
                                  CupertinoIcons.back,
                                  color: AppColors.grey,
                                ),
                              )),
                        ),
                        HorizontalSpace(width: getWidth(10)),
                        Expanded(child: ShowAppLogo()),
                        Padding(
                            padding: EdgeInsets.only(right: getWidth(6)),
                            child: MessageNotificationBox()),
                      ],
                    )
                  ],
                ),
              ),

              // Intro Text of Search Screen
              Positioned(
                  top: AppSizes.height * 0.12,
                  child: SizedBox(
                    width: AppSizes.width,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                      text: "From",
                                      style: getTextStyleMsrt(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: getWidth(25),
                                      )),
                                  TextSpan(
                                      text: " wherever you want",
                                      style: getTextStyleMsrt(
                                        color:
                                            Color(0xFFFEFEFE).withOpacity(0.5),
                                        fontWeight: FontWeight.bold,
                                        fontSize: getWidth(25),
                                      )),
                                  TextSpan(
                                      text: " - To ",
                                      style: getTextStyleMsrt(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: getWidth(25),
                                      )),
                                  TextSpan(
                                      text: "wherever you want",
                                      style: getTextStyleMsrt(
                                        color:
                                            Color(0xFFFEFEFE).withOpacity(0.5),
                                        fontWeight: FontWeight.bold,
                                        fontSize: getWidth(25),
                                      )),
                                ],
                              ),
                            ),
                            VerticalSpace(height: getHeight(40)),
                            Container(
                              padding: EdgeInsets.all(getWidth(16)),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: AppColors.white,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // item Details part
                                  ItemDetails(),
                                  VerticalSpace(height: getHeight(16)),
                                  CustomButton(
                                      height: getHeight(50),
                                      onPressed: () {
                                        Get.toNamed(AppRoute.searchScreen);
                                      },
                                      child: CustomText(
                                        text: "Add a Item",
                                        fontSize: getWidth(16),
                                        color: AppColors.white,
                                      ))
                                ],
                              ),
                            ),
                            VerticalSpace(height: getHeight(16)),
                          ],
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
