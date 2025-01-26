import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:flutter/material.dart';

class SelectIdentityCard extends StatelessWidget {
  const SelectIdentityCard({
    super.key,
    required this.isSelected,
    required this.iconPath,
    required this.title,
  });
  final bool isSelected;
  final String iconPath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getWidth(8)),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.primaryColor.withOpacity(0.3)
            : AppColors.white,
        borderRadius: BorderRadius.circular(getWidth(8)),
        border: Border.all(
            color: isSelected ? AppColors.primaryColor : AppColors.grey),
      ),
      child: Row(
        children: [
          HorizontalSpace(width: getWidth(10)),
          Image.asset(
            iconPath,
            color: isSelected ? AppColors.primaryColor : AppColors.grey,
            height: getHeight(30),
            width: getWidth(30),
          ),
          HorizontalSpace(width: getWidth(25)),
          CustomText(
            text: title,
            fontWeight: FontWeight.w700,
            fontSize: getWidth(16),
            color:
                isSelected ? AppColors.primaryColor : AppColors.bodyTextColor,
          ),
        ],
      ),
    );
  }
}
