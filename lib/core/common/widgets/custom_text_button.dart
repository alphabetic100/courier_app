import 'package:courierapp/core/common/styles/get_text_style.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.decorationThickness,
      this.fontWeight,
      this.fontSize,
      this.isUnderline,
      this.color});
  final double? decorationThickness;
  final double? fontSize;
  final FontWeight? fontWeight;
  final bool? isUnderline;
  final Function() onPressed;
  final String text;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Text(
          text,
          style: getTextStyleMsrt(
              fontWeight: fontWeight ?? FontWeight.w400,
              fontSize: fontSize ?? getWidth(16),
              color: color ?? Get.theme.primaryColor,
              decoration: isUnderline == true
                  ? TextDecoration.underline
                  : TextDecoration.none,
              decorationColor: color ?? Get.theme.primaryColor,
              decorationThickness: decorationThickness ?? 1.5),
        ));
  }
}
