import 'package:courierapp/core/common/widgets/create_trip_top_body.dart';
import 'package:courierapp/core/common/widgets/custom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_bottom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/custom_text_form_field.dart';
import 'package:courierapp/core/common/widgets/message_notification_box.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/features/create_trip/controller/create_trip_controller.dart';
import 'package:courierapp/features/create_trip/presentation/screens/add_additional_support_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetRulesScreen extends StatelessWidget {
  SetRulesScreen({super.key});

  final CreateTripController createTripController =
      Get.find<CreateTripController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: getWidth(16)),
            child: MessageNotificationBox(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CreateTripTopBody(title: "Create a trip"),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Set prohibitions for senders to follow (Optional)",
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: getWidth(16),
                  ),
                  VerticalSpace(height: getHeight(16)),
                  CustomTexFormField(
                    controller: createTripController.setRulesController,
                    maxLines: 4,
                    hintText: "e.g., No fragile items",
                  ),
                  VerticalSpace(height: getHeight(20)),
                  CustomButton(
                      height: getHeight(55),
                      isPrimary: false,
                      onPressed: () {
                        createTripController.addrule(createTripController
                            .setRulesController.text
                            .trim());
                        createTripController.setRulesController.clear();
                      },
                      child: CustomText(text: "Apply")),
                  VerticalSpace(height: getHeight(16)),
                  Obx(() => createTripController.rulesSet.isNotEmpty
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: createTripController.rulesSet
                              .map((rule) => Row(
                                    children: [
                                      Icon(Icons.error_outline,
                                          color: AppColors.error),
                                      HorizontalSpace(width: getWidth(5)),
                                      Expanded(
                                        child: CustomText(
                                          text: rule,
                                          color: AppColors.bodyTextColor,
                                          fontWeight: FontWeight.normal,
                                          fontSize: getWidth(14),
                                        ),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.delete,
                                            color: Colors.red),
                                        onPressed: () {
                                          createTripController.rulesSet
                                              .remove(rule);
                                        },
                                      ),
                                    ],
                                  ))
                              .toList(),
                        )
                      : SizedBox.shrink()),
                  VerticalSpace(height: getHeight(16)),
                  CustomText(
                    text: "Most common",
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: getWidth(16),
                  ),
                  VerticalSpace(height: getHeight(8)),
                  CustomButton(
                    isPrimary: false,
                    radious: getWidth(20),
                    color: Color(0xFFFAFAFC),
                    onPressed: () {
                      createTripController.addrule(
                          "No perishable food items without proper packaging.");
                    },
                    child: Row(
                      children: [
                        Icon(Icons.add, color: AppColors.bodyTextColor),
                        HorizontalSpace(width: getWidth(5)),
                        Expanded(
                          child: CustomText(
                            text:
                                "No perishable food items without proper packaging.",
                            fontSize: getWidth(14),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  VerticalSpace(height: getHeight(8)),
                  CustomButton(
                    isPrimary: false,
                    radious: getWidth(20),
                    color: Color(0xFFFAFAFC),
                    onPressed: () {
                      createTripController.addrule(
                          "No fragile items unless securely packaged.");
                    },
                    child: Row(
                      children: [
                        Icon(Icons.add, color: AppColors.bodyTextColor),
                        HorizontalSpace(width: getWidth(5)),
                        Expanded(
                          child: CustomText(
                            text: "No fragile items unless securely packaged.",
                            fontSize: getWidth(14),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(
        isPrimaryButton: false,
        onTap: () {},
        primaryWidget: Row(
          children: [
            // Expanded(
            //   child: CustomButton(
            //     isPrimary: false,
            //     onPressed: () {
            //       createTripController.addrule(
            //           createTripController.setRulesController.text.trim());
            //       createTripController.setRulesController.clear();
            //     },
            //     child: CustomText(
            //       text: "Set Another Rule",
            //       color: AppColors.bodyTextColor,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            // HorizontalSpace(width: getWidth(8)),
            Expanded(
              child: CustomButton(
                isPrimary: true,
                onPressed: () {
                  Get.to(
                    () => AddAdditionalSupportScreen(),
                    transition: Transition.rightToLeftWithFade,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeOut,
                  );
                },
                child: CustomText(
                  text: "Next",
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
