// Message received from the other person
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ReceivedMessage extends StatelessWidget {
  final String message;
  final String time;

  const ReceivedMessage({super.key, required this.message, required this.time});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        constraints: const BoxConstraints(maxWidth: 250),
        decoration: BoxDecoration(
          color: Color(0xFFF5F5F7),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(text: message, color: Colors.black87, fontSize: 14),
            const SizedBox(height: 4),
            CustomText(text: time, color: Colors.black54, fontSize: 10),
          ],
        ),
      ),
    );
  }
}
