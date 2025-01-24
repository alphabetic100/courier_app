import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/icon_path.dart';
import 'package:courierapp/features/search_screen/controller/search_screen_controller.dart';
import 'package:courierapp/features/search_screen/presentation/components/search_result_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// SearchResult screen
class SearchResultScreen extends StatelessWidget {
  SearchResultScreen({super.key});
  final SearchScreenController searchScreenController =
      Get.find<SearchScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getWidth(12)),
              child: Column(
                children: [
                  VerticalSpace(height: getHeight(10)),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                            padding: EdgeInsets.all(0),
                            height: getWidth(50),
                            width: getWidth(50),
                            isPrimary: false,
                            onPressed: () {},
                            child: Row(children: [
                              GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Icon(
                                  CupertinoIcons.back,
                                  color: AppColors.grey,
                                  size: getHeight(35),
                                  weight: getWidth(2),
                                ),
                              ),
                              HorizontalSpace(width: getWidth(5)),
                              Expanded(
                                  child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  FittedBox(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            CustomText(
                                              text: "Madrid",
                                              color: AppColors.black,
                                              fontSize: getWidth(14),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 5, right: 5),
                                              child: Image.asset(
                                                IconPath.arrow,
                                                width: getWidth(30),
                                                fit: BoxFit.fitWidth,
                                              ),
                                            ),
                                            CustomText(
                                              text: "Madrid",
                                              color: AppColors.black,
                                              fontSize: getWidth(14),
                                            ),
                                          ],
                                        ),
                                        CustomText(
                                          text: "Saturday, 15 October, 2kg",
                                          fontSize: getWidth(12),
                                        )
                                      ],
                                    ),
                                  ),
                                  Image.asset(
                                    IconPath.filterIcon,
                                    height: getWidth(40),
                                  )
                                ],
                              )),
                            ])),
                      ),
                      HorizontalSpace(width: getWidth(10)),
                      Stack(
                        children: [
                          CustomButton(
                              height: getWidth(50),
                              width: getWidth(50),
                              isPrimary: false,
                              onPressed: () {},
                              child: SizedBox(
                                width: getWidth(50),
                                child: Icon(
                                  CupertinoIcons.bubble_left,
                                  color: AppColors.grey,
                                ),
                              )),
                          Obx(
                            () => searchScreenController.hasNotification.value
                                ? Positioned(
                                    top: getHeight(5),
                                    right: getWidth(5),
                                    child: Container(
                                      height: getWidth(20),
                                      width: getWidth(20),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.error,
                                      ),
                                      child: Center(
                                        child: CustomText(
                                          text: "1",
                                          fontSize: 10,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ),
                                  )
                                : SizedBox.shrink(),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            VerticalSpace(height: getHeight(10)),
            Divider(
              color: AppColors.grey.withOpacity(0.6),
            ),
            SearchResultBody()
          ],
        ),
      ),
    );
  }
}
