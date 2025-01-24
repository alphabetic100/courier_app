import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:flutter/material.dart';

class PaymentSetupCard extends StatelessWidget {
  const PaymentSetupCard(
      {super.key,
      required this.onTap,
      required this.iconPath,
      required this.title,
      required this.isCardSelected});
  final Function() onTap;
  final String iconPath;
  final String title;
  final bool isCardSelected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.all(getWidth(8)),
          decoration: BoxDecoration(
            color: isCardSelected
                ? AppColors.primaryColor.withOpacity(0.3)
                : AppColors.white,
            borderRadius: BorderRadius.circular(getWidth(8)),
            border: Border.all(
                color:
                    isCardSelected ? AppColors.primaryColor : AppColors.grey),
          ),
          child: Row(
            children: [
              HorizontalSpace(width: getWidth(10)),
              Image.asset(
                iconPath,
                height: 30,
              ),
              HorizontalSpace(width: getWidth(25)),
              CustomText(
                text: title,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: isCardSelected
                    ? AppColors.primaryColor
                    : AppColors.bodyTextColor,
              ),
            ],
          )),
    );
  }
}
