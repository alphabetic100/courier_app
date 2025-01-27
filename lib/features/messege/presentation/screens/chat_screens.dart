import 'package:courierapp/core/common/widgets/custom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/image_path.dart';
import 'package:courierapp/features/messege/controller/chat_screen_controller.dart';
import 'package:courierapp/features/messege/presentation/components/message_input_box.dart';
import 'package:courierapp/features/messege/presentation/components/message_sent_by_me.dart';
import 'package:courierapp/features/messege/presentation/components/recived_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatInboxScreen extends StatelessWidget {
  const ChatInboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatController chatController = Get.find<ChatController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: SizedBox(
        height: AppSizes.height,
        child: Column(
          children: [
            VerticalSpace(height: getHeight(10)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getHeight(16)),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(ImagePath.profile),
                      ),
                      HorizontalSpace(width: getWidth(5)),
                      CustomText(
                        text: "Albert Flores",
                        fontSize: getWidth(20),
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                      HorizontalSpace(
                        width: getWidth(5),
                      ),
                      CircleAvatar(
                        radius: getWidth(7),
                        backgroundColor: Colors.green,
                      )
                    ],
                  ),
                  VerticalSpace(height: getHeight(20)),
                  Divider(
                    color: AppColors.grey,
                  )
                ],
              ),
            ),
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  itemCount: chatController.messages.length,
                  itemBuilder: (context, index) {
                    final message = chatController.messages[index];
                    return message['isSent']
                        ? MessageSentByMe(
                            message: message['text'],
                            time: message['time'],
                            sentStatus: message['sentStatus'],
                          )
                        : ReceivedMessage(
                            message: message['text'],
                            time: message['time'],
                          );
                  },
                );
              }),
            ),
            MessageInputBox(chatController: chatController),
          ],
        ),
      ),
    );
  }
}
