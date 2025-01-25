import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text_form_field.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/features/messege/controller/chat_screen_controller.dart';
import 'package:flutter/material.dart';

class MessageInputBox extends StatelessWidget {
  final ChatController chatController;
  const MessageInputBox({super.key, required this.chatController});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: CustomTexFormField(
                controller: chatController.textController,
                onChange: (p0) {
                  chatController.showSendbox();
                },
                hintText: 'Message here..',
              ),
            ),
            const SizedBox(width: 8),
            CustomButton(
              isPrimary: false,
              height: getHeight(55),
              width: getWidth(55),
              onPressed: () {
                chatController.sendMessage(chatController.textController.text);
                chatController.textController.clear();
              },
              child: Center(
                child: Icon(
                  Icons.send,
                  color: AppColors.grey,
                ),
              ),
            )
          ],
        ));
  }
}
