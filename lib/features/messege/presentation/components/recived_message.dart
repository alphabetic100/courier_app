import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class ReceivedMessage extends StatelessWidget {
  final String message;
  final String time;
  final String? image;

  const ReceivedMessage({
    super.key,
    required this.message,
    required this.time,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        constraints: BoxConstraints(maxWidth: getWidth(260)),
        decoration: BoxDecoration(
          color: AppColors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (image != null) ...[
              Image.network(image!,
                  height: 150, fit: BoxFit.cover), // Display image if available
              const SizedBox(height: 8),
            ],
            CustomText(
                text: message, color: AppColors.black, fontSize: getHeight(16)),
            const SizedBox(height: 4),
            CustomText(text: time, color: Colors.black54, fontSize: 10),
          ],
        ),
      ),
    );
  }
}
