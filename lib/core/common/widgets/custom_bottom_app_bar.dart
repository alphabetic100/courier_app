import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
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
      height: AppSizes.height * 0.18,
      padding: EdgeInsets.symmetric(
          horizontal: getWidth(16), vertical: getHeight(16)),
      color: AppColors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          secondaryWidget ?? SizedBox.shrink(),
          secondaryWidget != null
              ? VerticalSpace(height: getHeight(10))
              : SizedBox.shrink(),
          isPrimaryButton
              ? CustomButton(
                  onPressed: onTap,
                  child: CustomText(
                    text: primaryText ?? "Next",
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ))
              : primaryWidget ?? SizedBox.shrink(),
          SizedBox(height: getHeight(10)),
        ],
      ),
    );
  }
}
