import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title = "",
    this.centerTitle,
    this.actions,
    this.ontapBackButton,
    this.backButton = true,
  });
  final String title;
  final bool? centerTitle;
  final List<Widget>? actions;
  final VoidCallback? ontapBackButton;
  final bool backButton;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      title: title.isNotEmpty
          ? CustomText(
              text: title,
              fontSize: getWidth(18),
              color: AppColors.black,
            )
          : null,
      centerTitle: centerTitle,
      actions: actions,
      leading: backButton
          ? Padding(
              padding: EdgeInsets.only(
                  left: getWidth(12), top: getWidth(6), bottom: getWidth(6)),
              child: CustomButton(
                  isPrimary: false,
                  onPressed: ontapBackButton ??
                      () {
                        Get.back();
                      },
                  child: Center(
                    child: Icon(
                      CupertinoIcons.back,
                      color: AppColors.grey,
                    ),
                  )),
            )
          : null,
    );
  }
}
