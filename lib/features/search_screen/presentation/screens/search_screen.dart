import 'dart:developer';

import 'package:courierapp/core/utils/constants/image_path.dart';
import 'package:courierapp/features/landing/controller/landing_controller.dart';
import 'package:courierapp/features/search_screen/controller/item_controller.dart';
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

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SearchScreenController searchScreenController =
      Get.find<SearchScreenController>();
  final LandingController landingController = Get.find<LandingController>();
  final ItemController itemController = Get.put(ItemController());

  final formKey = GlobalKey<FormState>();

  String? validateLocation(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }

    if (value.length < 3) {
      return 'Location must be at least 3 characters';
    }
    return null;
  }

  String? validateDateTime(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select a date';
    }
    return null;
  }

  void onSearchPressed() {
    if (formKey.currentState?.validate() ?? false) {
      // All validations passed
      Get.toNamed(AppRoute.searchResultScreen);
      searchScreenController.searchTrip();
      log(searchScreenController.senderController.text);
      log(searchScreenController.receiverController.text);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                      color: Colors.grey.withOpacity(0.1),
                    ),
                  ),
                ],
              ),
              Container(
                height: AppSizes.height * 0.1,
                color: AppColors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      VerticalSpace(height: getHeight(16)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(child: ShowAppLogo()),
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
                    child: Form(
                      key: formKey,
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
                                  ),
                                ),
                                TextSpan(
                                  text: " wherever you want",
                                  style: getTextStyleMsrt(
                                    color: const Color(0xFFFEFEFE)
                                        .withOpacity(0.5),
                                    fontWeight: FontWeight.bold,
                                    fontSize: getWidth(25),
                                  ),
                                ),
                                TextSpan(
                                  text: " - To ",
                                  style: getTextStyleMsrt(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: getWidth(25),
                                  ),
                                ),
                                TextSpan(
                                  text: "wherever you want",
                                  style: getTextStyleMsrt(
                                    color: const Color(0xFFFEFEFE)
                                        .withOpacity(0.5),
                                    fontWeight: FontWeight.bold,
                                    fontSize: getWidth(25),
                                  ),
                                ),
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
                                  validator: validateLocation,
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
                                  validator: validateLocation,
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.only(
                                        top: getHeight(15),
                                        right: getHeight(20),
                                        left: getWidth(10),
                                        bottom: getHeight(15)),
                                    child: Image.asset(
                                      ImagePath.location,
                                      height: getHeight(25),
                                      color: AppColors.secondaryColor,
                                    ),
                                  ),
                                  // prefixIcon: SizedBox(
                                  //   child: Image.asset(
                                  //     ImagePath.location,
                                  //     fit: BoxFit.fill,
                                  //   ),
                                  // ),
                                ),
                                VerticalSpace(height: getHeight(20)),
                                CustomTexFormField(
                                  onTap: () {
                                    searchScreenController.selectDate(context);
                                  },
                                  readOnly: true,
                                  validator: validateDateTime,
                                  controller:
                                      searchScreenController.calenderController,
                                  hintText: "Calendar",
                                  prefixIcon: Icon(
                                    Icons.calendar_month,
                                    color: AppColors.secondaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          VerticalSpace(height: getHeight(16)),
                          CustomButton(
                            height: getHeight(50),
                            onPressed: onSearchPressed,
                            // onPressed: () {
                            //   // AuthService.logoutUser();
                            //   showDialog(
                            //       context: context,
                            //       builder: (_) {
                            //         return ShowPaymentSuccessDialog();
                            //       });
                            // },
                            child: CustomText(
                              text: "Search",
                              fontSize: getWidth(16),
                              color: AppColors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          VerticalSpace(height: getHeight(16)),
                          CustomButton(
                            isPrimary: false,
                            height: getHeight(50),
                            onPressed: () {
                              Get.to(() => AddItem());
                            },
                            child: CustomText(
                              text: "Add a Item",
                              fontSize: getWidth(16),
                              color: const Color(0xff677674),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          VerticalSpace(height: getHeight(24)),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: CustomText(
                              text: "Added Items",
                              fontSize: getWidth(16),
                              color: const Color(0xff262B2B),
                              fontWeight: FontWeight.w700,
                              textAlign: TextAlign.start,
                            ),
                          ),
                          VerticalSpace(height: getHeight(8)),
                          SingleChildScrollView(
                            child: Obx(() {
                              if (itemController.myItems.value == null ||
                                  itemController.myItems.value!.data.isEmpty) {
                                return Column(
                                  children: [
                                    VerticalSpace(height: getHeight(35)),
                                    CustomText(
                                      text: "No items added yet",
                                      fontSize: getWidth(14),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ],
                                );
                              } else {
                                final reversedItems = itemController
                                    .myItems.value!.data.reversed
                                    .toList();

                                return SizedBox(
                                  height: getHeight(200),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: reversedItems.length,
                                    itemBuilder: (context, index) {
                                      log(reversedItems.length.toString());
                                      final item = reversedItems[index];
                                      return Padding(
                                        padding: EdgeInsets.only(
                                            bottom: getHeight(20)),
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: ItemCardTwo(
                                            item: item,
                                            isSelected: false,
                                            isdeletable: true,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              }
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
