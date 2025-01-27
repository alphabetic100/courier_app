import 'package:courierapp/core/common/widgets/custom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_bottom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/message_notification_box.dart';
import 'package:courierapp/core/common/widgets/trip_details_top_body.dart';
import 'package:courierapp/core/common/widgets/trip_details_view.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/icon_path.dart';
import 'package:flutter/material.dart';

class CreateTripScreen7 extends StatelessWidget {
  const CreateTripScreen7({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: getWidth(16)),
            child: MessageNotificationBox(),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TripDetailsTopBody(title: "Create a Trip"),
            TripDetailsView(
                tripTransport: "Buss",
                availabileSpace: "12kg",
                tripRules: [
                  "No perishable food items without proper packaging.",
                  "No fragile items unless securely packaged.",
                ],
                transportIcon: IconPath.directionsBus,
                color: Colors.green)
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(
        isPrimaryButton: false,
        onTap: () {},
        primaryWidget: Row(
          children: [
            Expanded(
              child: CustomButton(
                  isPrimary: false,
                  onPressed: () {
                    // Get.defaultDialog(
                    //   title: "Worning",
                    // );
                    // showDialog(
                    //     context: context,
                    //     builder: (context) {
                    //       return ShowPaymentSuccessDialog();
                    //     });
                  },
                  child: CustomText(
                    text: "Cencel",
                    fontWeight: FontWeight.bold,
                    color: AppColors.grey,
                  )),
            ),
            HorizontalSpace(width: getWidth(16)),
            Expanded(
              child: CustomButton(
                  onPressed: () {},
                  child: CustomText(
                    text: "Create Trip",
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
