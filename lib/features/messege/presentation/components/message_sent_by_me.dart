import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessageSentByMe extends StatelessWidget {
  final String message;
  final String time;

  final String? image;

  const MessageSentByMe({
    super.key,
    required this.message,
    required this.time,
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
              if (image!.isNotEmpty) ...[
                Image.network(image!, height: 150, fit: BoxFit.cover),
                const SizedBox(height: 8),
              ]
            ],
            if (message.isNotEmpty) ...[
              CustomText(
                  text: message,
                  color: AppColors.white,
                  fontSize: getHeight(16)),
              const SizedBox(height: 4),
            ],
            const SizedBox(height: 4),
            CustomText(
                text: _formatTimestamp(time),
                color: Colors.white70,
                fontSize: 10),
          ],
        ),
      ),
    );
  }

  String _formatTimestamp(String timestamp) {
    try {
      DateTime dateTime = DateTime.parse(timestamp).toLocal();
      return DateFormat('h:mm a').format(dateTime); // 2:14 PM format
    } catch (e) {
      debugPrint("Error parsing timestamp: $e");
      return timestamp; // Return original timestamp if error occurs
    }
  }
}
