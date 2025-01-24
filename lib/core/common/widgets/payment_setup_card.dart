import 'package:courierapp/core/common/styles/get_text_style.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
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
        padding: EdgeInsets.all(8),
        height: getHeight(55),
        width: AppSizes.width,
        decoration: BoxDecoration(
          color: isCardSelected
              ? AppColors.primaryColor.withOpacity(0.1)
              : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: isCardSelected
              ? Border.all(color: AppColors.primaryColor)
              : Border.all(color: Color(0xFFE2E2E6)),
        ),
        child: Row(
          children: [
            Image.asset(
              iconPath,
              height: getHeight(25),
              width: getWidth(25),
            ),
            SizedBox(width: getWidth(10)),
            Text(title,
                style: getTextStyleMsrt(
                    color: Colors.black,
                    fontSize: getWidth(18),
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
