import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class QrFoundDialog extends StatelessWidget {
  const QrFoundDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const CustomText(
        text: 'QR Code Detected',
        color: AppColors.black,
      ),
      content: CustomText(
        text:
            'A QR code has been successfully detected. Please click the scan button to proceed.',
        fontWeight: FontWeight.normal,
      ),
      contentPadding: EdgeInsets.symmetric(vertical: getHeight(20)),
    );
  }
}
