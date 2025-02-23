import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/icon_path.dart';
import 'package:courierapp/features/my_trip/presentation/screens/qr_code_scanner_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QrScannerDialog extends StatelessWidget {
  const QrScannerDialog({super.key, required this.status});
  final String status;
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
          VerticalSpace(height: getHeight(10)),
          CustomText(
            text: "Be noted",
            fontSize: getWidth(24),
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
          const SizedBox(height: 16),
          CustomText(
              text: status == "accepted"
                  ? "When you scan the QR code of the sender the responsibility of the items will be passed over to you until the moment of delivery. LlamaFly is not responsible of any damages that the items might have over the duration of the service."
                  : status == "pickupped"
                      ? "When you scan the qr code, this delivery will be concluded and no additional services can be performed through this channel"
                      : "",
              textAlign: TextAlign.center,
              fontWeight: FontWeight.normal,
              fontSize: getWidth(16)),
          const SizedBox(height: 16),
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
              },
              child: CustomText(
                text: "Cancel",
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.grey,
              ),
            )),
            HorizontalSpace(width: 10),
            Expanded(
                child: CustomButton(
              isPrimary: true,
              onPressed: () {
                Navigator.of(context).pop();
                Get.to(() => QrCodeScannerScreen(
                      status: status,
                    ));
              },
              child: CustomText(
                text: "Proceed",
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ))
          ],
        )
      ],
    );
  }
}
