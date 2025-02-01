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
import 'package:courierapp/features/create_trip/presentation/screens/create_trip_summary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAdditionalSupportScreen extends StatelessWidget {
  AddAdditionalSupportScreen({super.key});
  final CreateTripController createTripController =
      Get.find<CreateTripController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: getWidth(16),
            ),
            child: MessageNotificationBox(),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CreateTripTopBody(title: "Create a trip"),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Additional Support you’d like to offer (Optional)",
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: getWidth(16),
                ),
                VerticalSpace(height: getHeight(16)),
                CustomTexFormField(
                  controller: createTripController.setRulesController,
                  maxLines: 4,
                  hintText: "e.g., Will deliver directly to recipient’s door.",
                ),
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
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: AppColors.bodyTextColor,
                        ),
                        HorizontalSpace(width: getWidth(5)),
                        Expanded(
                          child: CustomText(
                            text: "Can pick up parcels from senders.",
                            fontSize: getWidth(14),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    )),
                //

                VerticalSpace(height: getHeight(8)),
                //

                CustomButton(
                    isPrimary: false,
                    radious: getWidth(20),
                    color: Color(0xFFFAFAFC),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: AppColors.bodyTextColor,
                        ),
                        HorizontalSpace(width: getWidth(5)),
                        Expanded(
                          child: CustomText(
                            text: "Will deliver directly to recipient’s door.",
                            fontSize: getWidth(14),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomAppBar(
        isPrimaryButton: false,
        onTap: () {},
        primaryWidget: Row(
          children: [
            Expanded(
                child: CustomButton(
                    isPrimary: false,
                    onPressed: () {},
                    child: CustomText(
                      text: "Set Another Rule",
                      color: AppColors.bodyTextColor,
                      fontWeight: FontWeight.bold,
                    ))),
            HorizontalSpace(width: getWidth(8)),
            Expanded(
                child: CustomButton(
                    isPrimary: true,
                    onPressed: () {
                      Get.to(
                        () => CreateTripSummary(),
                        transition: Transition.rightToLeftWithFade,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                      );
                    },
                    child: CustomText(
                      text: "Next",
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    )))
          ],
        ),
      ),
    );
  }
}
