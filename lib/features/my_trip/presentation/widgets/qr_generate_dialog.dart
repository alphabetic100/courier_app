import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/icon_path.dart';
import 'package:courierapp/features/my_trip/controller/qr_controller.dart';
import 'package:courierapp/features/my_trip/presentation/screens/qr_code_generator_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QrGenerateDialog extends StatelessWidget {
  QrGenerateDialog({super.key, required this.bookingID, required this.status});
  final QrController qrController = Get.put(QrController());
  final String bookingID;
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
                  ? "When the traveler scans this QR code you are acknowledging that all the items that you are sending are legal both in the place of departure and the place of arival. note that LlamaFly is not responsible for any damages."
                  : status == "pickupped"
                      ? "By generating this QR code, you are preparing for the delivery confirmation. Please note, the delivery will only be marked as successful once the QR code is scanned by the traveller. You can download and share this code with the receiver."
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
                status == "accepted"
                    ? qrController.generateQRforPicUp(bookingID)
                    : status == "pickupped"
                        ? qrController.generateQRforDeliverd(bookingID)
                        : null;
                Get.to(() => QRCodeGeneratorScreen());
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
