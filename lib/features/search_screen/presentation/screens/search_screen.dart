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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                        color: const Color(0xffFAFAFC),
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
                                    controller: searchScreenController
                                        .receiverController,
                                    hintText: "To",
                                    validator: validateLocation,
                                    prefixIcon: Icon(
                                      Icons.location_on_outlined,
                                      color: AppColors.secondaryColor,
                                    ),
                                  ),
                                  VerticalSpace(height: getHeight(20)),
                                  CustomTexFormField(
                                    onTap: () {
                                      searchScreenController
                                          .selectDate(context);
                                    },
                                    readOnly: true,
                                    validator: validateDateTime,
                                    controller: searchScreenController
                                        .calenderController,
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
                            Obx(
                              () => ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: searchScreenController.items.length,
                                itemBuilder: (context, index) {
                                  final item =
                                      searchScreenController.items[index];
                                  return Padding(
                                    padding:
                                        EdgeInsets.only(bottom: getHeight(20)),
                                    child: GestureDetector(
                                      onTap: () {
                                        //requestShippingController.toggleSelection(index);
                                      },
                                      child: ItemCardTwo(item: item),
                                    ),
                                  );
                                },
                              ),
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
      ),
    );
  }
}
