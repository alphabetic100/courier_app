import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/features/landing/controller/landing_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowPaymentSuccessDialog extends StatelessWidget {
  const ShowPaymentSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/icons/success2.png",
            height: getHeight(70),
          ),
          VerticalSpace(height: getHeight(10)),
          CustomText(
            text: "Request Sent",
            fontSize: getWidth(24),
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
          const SizedBox(height: 16),
          CustomText(
              text: "Your shipment request has been sent to Albert Flores.",
              textAlign: TextAlign.center,
              fontWeight: FontWeight.normal,
              fontSize: getWidth(16)),
          const SizedBox(height: 16),
          Divider(
            color: AppColors.grey,
          ),
          VerticalSpace(height: getHeight(10)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.arrow_forward,
                color: AppColors.secondaryColor,
              ),
              HorizontalSpace(width: getWidth(5)),
              SizedBox(
                width: AppSizes.width * 0.4,
                child: CustomText(
                  text: "Albert Flores will review your request.",
                  fontWeight: FontWeight.normal,
                  fontSize: getWidth(14),
                ),
              )
            ],
          ),
          VerticalSpace(height: getHeight(10)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.arrow_forward,
                color: AppColors.secondaryColor,
              ),
              HorizontalSpace(width: getWidth(5)),
              SizedBox(
                width: AppSizes.width * 0.4,
                child: CustomText(
                  text:
                      "You’ll be notified when Albert accepts or declines your request.",
                  fontWeight: FontWeight.normal,
                  fontSize: getWidth(14),
                ),
              )
            ],
          )
        ],
      ),
      actions: [
        Expanded(
            child: CustomButton(
                onPressed: () {
                  Get.offAll(() => LandingController());
                },
                child: CustomText(
                  text: "Back to home",
                  color: AppColors.white,
                )))
      ],
    );
  }
}
