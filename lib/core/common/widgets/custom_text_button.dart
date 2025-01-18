import 'package:courierapp/core/common/styles/get_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.decorationThickness,
      this.fontWeight});
  final double? decorationThickness;
  final FontWeight? fontWeight;
  final Function() onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Text(
          text,
          style: getTextStyleMsrt(
              fontWeight: fontWeight ?? FontWeight.w400,
              color: Get.theme.primaryColor,
              decoration: TextDecoration.underline,
              decorationColor: Get.theme.primaryColor,
              decorationThickness: decorationThickness ?? 1.5),
        ));
  }
}
