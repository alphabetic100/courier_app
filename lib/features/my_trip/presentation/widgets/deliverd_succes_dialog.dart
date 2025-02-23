import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:flutter/material.dart';

class DeliverdSuccesDialog extends StatelessWidget {
  const DeliverdSuccesDialog({super.key});

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
            "assets/icons/success1.png",
            height: getHeight(70),
          ),
          VerticalSpace(height: getHeight(10)),
          CustomText(
            text: "Delivery Successful",
            fontSize: getWidth(24),
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
          const SizedBox(height: 16),
          CustomText(
              text:
                  "Delivery completed. Thank you for ensuring the parcel reached its destination.",
              textAlign: TextAlign.center,
              fontWeight: FontWeight.normal,
              fontSize: getWidth(16)),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
