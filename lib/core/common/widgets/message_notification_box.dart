import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/features/search_screen/controller/search_screen_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MessageNotificationBox extends StatelessWidget {
  MessageNotificationBox({super.key});
  final SearchScreenController searchScreenController =
      Get.find<SearchScreenController>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomButton(
            width: getWidth(50),
            isPrimary: false,
            onPressed: () {},
            child: SizedBox(
              width: getWidth(50),
              child: Icon(
                CupertinoIcons.bubble_left,
                color: AppColors.grey,
              ),
            )),
        Obx(
          () => searchScreenController.hasNotification.value
              ? Positioned(
                  top: getHeight(5),
                  right: getWidth(5),
                  child: Container(
                    height: getWidth(20),
                    width: getWidth(20),
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
    );
  }
}
