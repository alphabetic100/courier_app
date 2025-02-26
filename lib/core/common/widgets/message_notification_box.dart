import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/features/messege/presentation/screens/message_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MessageNotificationBox extends StatelessWidget {
  const MessageNotificationBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      width: 46,
      child: Align(
        alignment: Alignment.center,
        child: CustomButton(
          width: 50,
          height: 50,
          isPrimary: false,
          onPressed: () {
            Get.to(() => MessageScreen());
          },
          child: Icon(
            CupertinoIcons.bubble_left,
            color: AppColors.grey,
            size: 28,
          ),
        ),
      ),
    );
  }
}
