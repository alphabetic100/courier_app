import 'package:courierapp/core/common/widgets/custom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/image_path.dart';
import 'package:courierapp/features/messege/controller/message_screen_controller.dart';
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
  final MessageScreenController controller = Get.put(MessageScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        color: Color(0xFFFAFAFC),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VerticalSpace(height: getHeight(20)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
              child: CustomText(
                text: "Message",
                fontWeight: FontWeight.bold,
                color: AppColors.black,
                fontSize: getWidth(25),
              ),
            ),
            VerticalSpace(height: getHeight(20)),
            Divider(
              color: AppColors.grey,
            ),
            VerticalSpace(height: getHeight(20)),
            Expanded(
              child: Container(
                color: AppColors.white,
                padding: EdgeInsets.symmetric(
                  horizontal: getWidth(16),
                ),
                child: RefreshIndicator(
                  color: AppColors.primaryColor,
                  onRefresh: () => controller.getMyChatList(),
                  child: Obx(
                    () {
                      final chatList = controller.chatlists.value;
                      if (chatList == null) {
                        return Center(
                          child: Text("Check your internet connection"),
                        );
                      } else if (chatList.data.isEmpty) {
                        return Center(
                          child: Text("You have no conversation"),
                        );
                      } else {
                        return ListView.builder(
                          itemCount: chatList.data.length,
                          itemBuilder: (context, index) {
                            final user = chatList.data[index];
                            return Padding(
                              padding:
                                  EdgeInsets.symmetric(vertical: getHeight(10)),
                              child: GestureDetector(
                                onTap: () => Get.to(() => ChatInboxScreen(
                                      profileImage: user.user.profileImage,
                                      userName: user.user.fullName.isNotEmpty
                                          ? user.user.fullName
                                          : "User",
                                      user2ndId: user.user.id,
                                    )),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: getHeight(10),
                                      vertical: getHeight(15)),
                                  decoration: BoxDecoration(
                                      color: Color(0xFFFAFAFC),
                                      border: Border.all(color: AppColors.grey),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        backgroundImage:
                                            user.user.profileImage.isNotEmpty
                                                ? NetworkImage(
                                                    user.user.profileImage)
                                                : AssetImage(ImagePath.profile),
                                        radius: getWidth(15),
                                      ),
                                      HorizontalSpace(width: getWidth(10)),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            text: user.user.fullName.isNotEmpty
                                                ? user.user.fullName
                                                : "User",
                                            color: AppColors.black,
                                            fontSize: getWidth(18),
                                            fontWeight: FontWeight.bold,
                                          ),
                                          CustomText(
                                            text: user.lastMessage.isNotEmpty
                                                ? user.lastMessage
                                                : "message not supported",
                                            fontWeight: FontWeight.normal,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
