import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class MessageSentByMe extends StatelessWidget {
  final String message;
  final String time;
  final String sentStatus;
  final String? image;

  const MessageSentByMe({
    super.key,
    required this.message,
    required this.time,
    required this.sentStatus,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        constraints: BoxConstraints(maxWidth: getWidth(260)),
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (image != null) ...[
              Image.network(image!,
                  height: 150, fit: BoxFit.cover), 
              const SizedBox(height: 8),
            ],
            CustomText(
                text: message, color: Colors.white, fontSize: getHeight(16)),
            const SizedBox(height: 4),
            CustomText(text: time, color: Colors.white70, fontSize: 10),
          ],
        ),
      ),
    );
  }
}
