import 'dart:developer';

import 'package:courierapp/core/common/styles/get_text_style.dart';
import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text_button.dart';
import 'package:courierapp/core/common/widgets/custom_text_form_field.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/features/messege/controller/chat_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageInputBox extends StatelessWidget {
  final ChatController chatController;
  final String reciverId;
  const MessageInputBox(
      {super.key, required this.chatController, required this.reciverId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Container(
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
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.error_outline,
                    color: AppColors.secondaryColor,
                    size: getWidth(25),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: getWidth(14),
                          fontWeight: FontWeight.normal,
                        ),
                        children: [
                          TextSpan(
                              text: "Please ",
                              style: getTextStyleMsrt(
                                fontSize: getWidth(14),
                                color: AppColors.grey,
                                fontWeight: FontWeight.normal,
                              )),
                          WidgetSpan(
                            child: CustomTextButton(
                              onPressed: () {
                                log("report");
                              },
                              text: "report",
                              fontSize: getWidth(14),
                              isUnderline: true,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            style: getTextStyleMsrt(
                              fontSize: getWidth(14),
                              color: AppColors.grey,
                              fontWeight: FontWeight.normal,
                            ),
                            text:
                                " any suspicious behavior. Do not perform any payments outside of the platform in order to protect your information.",
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              VerticalSpace(height: 10),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: getHeight(55),
                      child: CustomTexFormField(
                        controller: chatController.textController,
                        onChange: (p0) {
                          chatController.showSendbox();
                        },
                        hintText: 'Message here..',
                      ),
                    ),
                  ),
                  Obx(() => chatController.showAttuchIcon.value
                      ? Row(
                          children: [
                            const SizedBox(width: 8),
                            CustomButton(
                              isPrimary: false,
                              height: getHeight(55),
                              width: getWidth(55),
                              onPressed: () {
                                chatController.pickImage();
                              },
                              child: Center(
                                child: Icon(
                                  Icons.attach_file,
                                  color: AppColors.grey,
                                ),
                              ),
                            ),
                          ],
                        )
                      : SizedBox.shrink()),
                  const SizedBox(width: 8),
                  CustomButton(
                    isPrimary: true,
                    height: getHeight(55),
                    width: getWidth(55),
                    onPressed: () async {
                      String? imageUrl;

                      // If an image is selected, upload it and get the link
                      if (chatController.selectedImage.value.isNotEmpty) {
                        await chatController.generateImageLink();
                        imageUrl = chatController.generatedImageLink.value;
                      }

                      // Send message with the uploaded image (if available)
                      chatController.sendMessage(
                        message: chatController.textController.text,
                        reciverId: reciverId,
                        image: imageUrl,
                      );

                      // Reset UI state
                      chatController.selectedImage.value = "";
                      chatController.textController.clear();
                      chatController.showAttuchIcon.value = true;
                    },
                    child: Center(
                      child: Icon(
                        Icons.send,
                        color: AppColors.white,
                      ),
                    ),
                  )
                ],
              ),
            ],
          )),
    );
  }
}
