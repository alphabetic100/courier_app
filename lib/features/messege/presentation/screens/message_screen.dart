import 'package:courierapp/core/common/widgets/custom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/image_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'chat_screens.dart';

class Message {
  final String name;
  final String lastMessage;
  final String time;
  final String avatarUrl;
  final bool seen;

  Message({
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.avatarUrl,
    this.seen = false,
  });
}

class MessageScreen extends StatelessWidget {
  MessageScreen({super.key});
  final List<Message> messages = [
    Message(
      name: 'Liam Parker',
      lastMessage: 'Hei, there, what\'s Up ???',
      time: '05:47 PM',
      avatarUrl: ImagePath.backGroundImage,
      seen: false,
    ),
    Message(
      name: 'Sophia Lee',
      lastMessage: 'Have you been to any co...',
      time: '12:25 PM',
      avatarUrl: ImagePath.backGroundImage,
      seen: true,
    ),
    Message(
      name: 'Ethan Taylor',
      lastMessage: 'Hey! How\'s your day goin...',
      time: '10:42 AM',
      avatarUrl: ImagePath.backGroundImage,
      seen: false,
    ),
    // Add more messages as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getWidth(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VerticalSpace(height: getHeight(20)),
            CustomText(
              text: "Message",
              fontWeight: FontWeight.bold,
              color: AppColors.black,
              fontSize: getWidth(25),
            ),
            VerticalSpace(height: getHeight(20)),
            Divider(
              color: AppColors.grey,
            ),
            VerticalSpace(height: getHeight(20)),
            Expanded(
                child: RefreshIndicator(
                    color: AppColors.primaryColor,
                    onRefresh: () async {},
                    child: ListView.builder(
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: getHeight(10)),
                            child: GestureDetector(
                              onTap: () => Get.to(() => ChatInboxScreen(
                                  // profileImagePath: ImagePath.profile,
                                  // userName: "Mr. Sodium Chloride",
                                  // userHandle: 'sdfe',
                                  )),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: getHeight(10),
                                    vertical: getHeight(15)),
                                decoration: BoxDecoration(
                                    border: Border.all(color: AppColors.grey),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      radius: getWidth(15),
                                    ),
                                    HorizontalSpace(width: getWidth(10)),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text: messages[index].name,
                                          color: AppColors.black,
                                          fontSize: getWidth(18),
                                          fontWeight: FontWeight.bold,
                                        ),
                                        CustomText(
                                          text: messages[index].lastMessage,
                                          fontWeight: FontWeight.normal,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        })))
          ],
        ),
      ),
    );
  }
}
