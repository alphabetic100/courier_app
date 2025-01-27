import 'package:courierapp/core/common/styles/get_text_style.dart';
import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/custom_text_form_field.dart';
import 'package:courierapp/core/common/widgets/message_notification_box.dart';
import 'package:courierapp/core/common/widgets/show_app_logo.dart';
import 'package:courierapp/core/services/Auth_service.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/features/search_screen/controller/search_screen_controller.dart';
import 'package:courierapp/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
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
                    height: AppSizes.height * 0.5,
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
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      VerticalSpace(height: getHeight(16)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: ShowAppLogo()),
                          MessageNotificationBox(),
                        ],
                      )
                    ],
                  ),
                ),
              ),

              // Intro Text of Search Screen
              Positioned(
                  top: AppSizes.height * 0.13,
                  child: SizedBox(
                    width: AppSizes.width,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
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
                                      fontSize: getWidth(35),
                                    )),
                                TextSpan(
                                    text: " wherever you want",
                                    style: getTextStyleMsrt(
                                      color: Color(0xFFFEFEFE).withOpacity(0.5),
                                      fontWeight: FontWeight.bold,
                                      fontSize: getWidth(35),
                                    )),
                                TextSpan(
                                    text: " - To ",
                                    style: getTextStyleMsrt(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: getWidth(35),
                                    )),
                                TextSpan(
                                    text: "wherever you want",
                                    style: getTextStyleMsrt(
                                      color: Color(0xFFFEFEFE).withOpacity(0.5),
                                      fontWeight: FontWeight.bold,
                                      fontSize: getWidth(35),
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
                              children: [
                                CustomTexFormField(
                                  controller:
                                      searchScreenController.senderController,
                                  hintText: "From",
                                  prefixIcon: Icon(
                                    Icons.send,
                                    color: AppColors.secondaryColor,
                                  ),
                                ),
                                VerticalSpace(height: getHeight(20)),
                                CustomTexFormField(
                                  controller:
                                      searchScreenController.receiverController,
                                  hintText: "To",
                                  prefixIcon: Icon(
                                    Icons.location_on_outlined,
                                    color: AppColors.secondaryColor,
                                  ),
                                ),
                                VerticalSpace(height: getHeight(20)),
                                CustomTexFormField(
                                  onTap: () {
                                    searchScreenController.selectDate(context);
                                  },
                                  readOnly: true,
                                  controller:
                                      searchScreenController.calenderController,
                                  hintText: "Calendar",
                                  prefixIcon: Icon(
                                    Icons.calendar_month,
                                    color: AppColors.secondaryColor,
                                  ),
                                ),
                                VerticalSpace(height: getHeight(20)),
                                CustomTexFormField(
                                  controller: searchScreenController
                                      .itemWeightController,
                                  hintText: "Item weight",
                                  prefixIcon: Icon(
                                    CupertinoIcons.cube_box,
                                    color: AppColors.secondaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          VerticalSpace(height: getHeight(16)),
                          CustomButton(
                              height: getHeight(50),
                              onPressed: () {
                                Get.toNamed(AppRoute.searchResultScreen);
                              },
                              child: CustomText(
                                text: "Search Travelers",
                                fontSize: getWidth(16),
                                color: AppColors.white,
                              ))
                        ],
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
