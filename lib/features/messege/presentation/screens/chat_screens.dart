import 'dart:io';

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

class ChatInboxScreen extends StatefulWidget {
  const ChatInboxScreen(
      {super.key,
      required this.user2ndId,
      required this.userName,
      required this.profileImage});
  final String user2ndId;
  final String userName;
  final String profileImage;

  @override
  State<ChatInboxScreen> createState() => _ChatInboxScreenState();
}

class _ChatInboxScreenState extends State<ChatInboxScreen> {
  final ChatController chatController = Get.find<ChatController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chatController.createChatRoom(
        user1Id: "67b16a5e50e667bdaa7e2022", user2Id: widget.user2ndId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: SizedBox(
        height: AppSizes.height,
        child: Column(
          children: [
            VerticalSpace(height: getHeight(10)),
            Column(
              children: [
                Container(
                  color: Color(0xFFFAFAFC),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: widget.profileImage.isNotEmpty
                              ? NetworkImage(widget.profileImage)
                              : AssetImage(ImagePath.profile),
                        ),
                        HorizontalSpace(width: getWidth(5)),
                        CustomText(
                          text: widget.userName,
                          fontSize: getWidth(20),
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                        HorizontalSpace(
                          width: getWidth(5),
                        ),
                        CircleAvatar(
                          radius: getWidth(4),
                          backgroundColor: Colors.green,
                        )
                      ],
                    ),
                  ),
                ),
                VerticalSpace(height: getHeight(20)),
                Divider(
                  color: AppColors.grey,
                )
              ],
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
            Align(
              alignment: Alignment.centerLeft,
              child: Obx(() => chatController.selectedImage.isNotEmpty
                  ? Padding(
                      padding: EdgeInsets.only(left: getWidth(16)),
                      child: Stack(
                        children: [
                          Container(
                            height: getHeight(100),
                            width: getWidth(100),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: FileImage(
                                  File(chatController.selectedImage.value),
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Positioned(
                              right: 1,
                              top: 2,
                              child: GestureDetector(
                                onTap: () {
                                  chatController.selectedImage.value = "";
                                },
                                child: Icon(
                                  Icons.close,
                                  color: Colors.red,
                                  shadows: [
                                    Shadow(),
                                  ],
                                ),
                              ))
                        ],
                      ),
                    )
                  : SizedBox.shrink()),
            ),
            MessageInputBox(chatController: chatController),
          ],
        ),
      ),
    );
  }
}
