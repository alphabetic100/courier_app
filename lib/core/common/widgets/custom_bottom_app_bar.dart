import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:flutter/cupertino.dart';

import 'custom_text.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar(
      {super.key,
      required this.isPrimaryButton,
      this.secondaryWidget,
      this.primaryWidget,
      this.primaryText,
      required this.onTap});
  final bool isPrimaryButton;
  final VoidCallback onTap;
  final String? primaryText;
  final Widget? secondaryWidget;
  final Widget? primaryWidget;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.height * 0.13,
      padding: EdgeInsets.symmetric(horizontal: getWidth(12)),
      color: AppColors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          secondaryWidget ?? SizedBox.shrink(),
          isPrimaryButton
              ? CustomButton(
                  onPressed:onTap,
                  child: CustomText(
                    text: primaryText ?? "Next",
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ))
              : primaryWidget ?? SizedBox.shrink(),
        ],
      ),
    );
  }
}
