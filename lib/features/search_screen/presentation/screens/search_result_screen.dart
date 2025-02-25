import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/message_notification_box.dart';
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
            Container(
              color: Color(0xffFAFAFC),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: getWidth(16),
                      right: getWidth(16),
                      top: getHeight(16),
                    ),
                    child: Column(
                      children: [
                        VerticalSpace(height: getHeight(16)),
                        Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                  padding: EdgeInsets.all(0),
                                  height: 50,
                                  // width: getWidth(50),
                                  isPrimary: false,
                                  onPressed: () {},
                                  child: Row(children: [
                                    GestureDetector(
                                      onTap: () {
                                        searchScreenController
                                            .clearTextFields();
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
                                        child: FittedBox(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: searchScreenController
                                                            .senderController
                                                            .text
                                                            .length >
                                                        15
                                                    ? AppSizes.width * 0.26
                                                    : null,
                                                child: CustomText(
                                                  text: searchScreenController
                                                      .senderController.text,
                                                  color: AppColors.black,
                                                  fontSize: getWidth(14),
                                                  textOverflow:
                                                      TextOverflow.ellipsis,
                                                ),
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
                                              SizedBox(
                                                width: AppSizes.width * 0.3,
                                                child: CustomText(
                                                  text: searchScreenController
                                                      .receiverController.text,
                                                  color: AppColors.black,
                                                  fontSize: getWidth(14),
                                                  textOverflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                          CustomText(
                                            text: searchScreenController
                                                .searchDate.value,
                                            fontSize: getWidth(12),
                                          )
                                        ],
                                      ),
                                    )),
                                  ])),
                            ),
                            HorizontalSpace(width: getWidth(16)),
                            // MessageNotificationBox(),
                            MessageNotificationBox()
                          ],
                        )
                      ],
                    ),
                  ),
                  VerticalSpace(height: getHeight(10)),
                  Container(
                    height: getHeight(1),
                    width: double.infinity,
                    color: Color(0xffCCD9D6),
                  )
                ],
              ),
            ),
            SizedBox(
              height: getHeight(8),
            ),
            SearchResultBody()
          ],
        ),
      ),
    );
  }
}
