import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/icon_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WithoutPaymentPopDialog extends StatelessWidget {
  const WithoutPaymentPopDialog({super.key});

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
            IconPath.worningIcon,
            height: getHeight(70),
          ),
          SizedBox(height: getHeight(10)),
          CustomText(
            text: "Warning",
            fontSize: getWidth(24),
            fontWeight: FontWeight.bold,
            color: AppColors.error,
          ),
          const SizedBox(height: 16),
          CustomText(
            text:
                "If you exit without completing the payment, your booking will not be confirmed, and all booking data will be permanently removed.",
            fontWeight: FontWeight.normal,
          )
        ],
      ),
      actions: [
        Row(
          children: [
            Expanded(
                child: CustomButton(
              isPrimary: false,
              onPressed: () {
                Navigator.of(context).pop();
                // Future.delayed(Duration(milliseconds: 200), () {
                //   Get.back();
                // });
              },
              child: CustomText(text: "Okay"),
            )),
          ],
        )
      ],
    );
  }
}
