import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/common/styles/get_text_style.dart';
import '../../../../core/common/widgets/custom_button.dart';
import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/common/widgets/custom_text_form_field.dart';
import '../../../../core/common/widgets/item_card_two.dart';
import '../../../../core/common/widgets/message_notification_box.dart';
import '../../../../core/common/widgets/show_app_logo.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_sizes.dart';
import '../../../../core/utils/constants/app_spacers.dart';
import '../../../../routes/app_routes.dart';
import '../../controller/search_screen_controller.dart';
import 'add_item.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final SearchScreenController searchScreenController =
  Get.find<SearchScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView( // Wrap with SingleChildScrollView
          child: SizedBox(
            height: AppSizes.height,
            width: AppSizes.width,
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: AppSizes.height * 0.4,
                      color: AppColors.secondaryColor,
                    ),
                    Expanded(
                      child: Container(
                        color: Color(0xffFAFAFC),
                      ),
                    ),
                  ],
                ),
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
                Positioned(
                    top: AppSizes.height * 0.12,
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
                                        fontSize: getWidth(25),
                                      )),
                                  TextSpan(
                                      text: " wherever you want",
                                      style: getTextStyleMsrt(
                                        color: Color(0xFFFEFEFE).withOpacity(0.5),
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
                                        color: Color(0xFFFEFEFE).withOpacity(0.5),
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
                                  text: "Search",
                                  fontSize: getWidth(16),
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w700,
                                )),
                            VerticalSpace(height: getHeight(16)),
                            CustomButton(
                                isPrimary: false,
                                height: getHeight(50),
                                onPressed: () {
                                  Get.to(() => AddItem());
                                  // Get.toNamed(AppRoute.searchResultScreen);
                                },
                                child: CustomText(
                                  text: "Add a Item",
                                  fontSize: getWidth(16),
                                  color: Color(0xff677674),
                                  fontWeight: FontWeight.w700,
                                )),
                            VerticalSpace(height: getHeight(24)),

                            Align(
                              alignment: Alignment.centerLeft,
                                child: CustomText(text: "Added Items", fontSize: getWidth(16), color: Color(0xff262B2B), fontWeight: FontWeight.w700,textAlign: TextAlign.start,)),
                            VerticalSpace(height: getHeight(8)),
                            Obx(() => ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: searchScreenController.items.length,
                              itemBuilder: (context, index) {
                                final item = searchScreenController.items[index];
                                return Padding(
                                  padding: EdgeInsets.only(bottom: getHeight(20)),
                                  child: GestureDetector(
                                    onTap: () {
                                      //requestShippingController.toggleSelection(index);
                                    },
                                    child: ItemCardTwo(item: item),
                                  ),
                                );
                              },
                            )),
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
