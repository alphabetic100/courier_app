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
    this.backgroundColor,
  });
  final String title;
  final bool? centerTitle;
  final List<Widget>? actions;
  final VoidCallback? ontapBackButton;
  final bool backButton;
  final Color? backgroundColor;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: false,
      surfaceTintColor: Colors.transparent,
      backgroundColor: backgroundColor ?? Color(0xFFFAFAFC),
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
                left: getWidth(12),
              ),
              child: SizedBox(
                width: 50,
                height: 46,
                child: Align(
                  alignment: Alignment.center,
                  child: CustomButton(
                    isPrimary: false,
                    height: 46,
                    width: 55,
                    onPressed: ontapBackButton ?? () => Get.back(),
                    child: Icon(
                      CupertinoIcons.back,
                      color: AppColors.grey,
                      size: 28,
                    ),
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
