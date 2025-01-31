import 'package:courierapp/core/common/widgets/create_trip_top_body.dart';
import 'package:courierapp/core/common/widgets/custom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_bottom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/custom_text_form_field.dart';
import 'package:courierapp/core/common/widgets/message_notification_box.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/features/create_trip/presentation/screens/create_trip_screen7.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateTripScreen6 extends StatelessWidget {
  const CreateTripScreen6({super.key});

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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CreateTripTopBody(title: "Create a trip"),
            CustomText(
              text: "Set rules for senders to follow (Optional)",
              color: AppColors.black,
              fontWeight: FontWeight.bold,
              fontSize: getWidth(16),
            ),
            VerticalSpace(height: getHeight(16)),
            CustomTexFormField(
              maxLines: 4,
              hintText: "e.g., No fragile items",
            )
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(
          isPrimaryButton: true,
          onTap: () {
            Get.to(
              () => CreateTripScreen7(),
              transition: Transition.rightToLeftWithFade,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          }),
    );
  }
}
