import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/features/messege/presentation/screens/message_screen.dart';
import 'package:courierapp/features/search_screen/controller/search_screen_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MessageNotificationBox extends StatelessWidget {
  MessageNotificationBox({super.key});
  final SearchScreenController searchScreenController =
      Get.find<SearchScreenController>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => MessageScreen());
      },
      child: SizedBox(
        height: 46,
        width: 46,
        child: Align(
          alignment: Alignment.center,
          child: Stack(
            children: [
              CustomButton(
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
              Obx(
                () => searchScreenController.hasNotification.value
                    ? Positioned(
                        top: 6,
                        right: 5,
                        child: Container(
                          height: 18,
                          width: 18,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.error,
                          ),
                          child: Center(
                            child: CustomText(
                              text: "1",
                              fontSize: 10,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      )
                    : SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
