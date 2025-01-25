import 'package:courierapp/core/common/styles/get_text_style.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:flutter/material.dart';

Widget ruleButton(
    String title, String iconPath, Function() onTap, bool isSelected) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: getHeight(140),
      width: AppSizes.width * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isSelected ? AppColors.primaryColor : AppColors.grey,
        ),
        color:
            isSelected ? AppColors.primaryColor.withOpacity(0.1) : AppColors.white,
      ),
      padding: EdgeInsets.symmetric(
          horizontal: getWidth(20), vertical: getWidth(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: isSelected ? AppColors.white : AppColors.primaryColor,
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Image.asset(
                iconPath,
                color: isSelected ? AppColors.primaryColor : AppColors.white,
              ),
            ),
          ),
          Text(
            title,
            style: getTextStyleMsrt(
              fontSize: 18,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
