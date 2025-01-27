import 'package:courierapp/core/common/styles/get_text_style.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/app_sizes.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextAlign? textAlign;
  const CustomText(
      {super.key,
      required this.text,
      this.maxLines,
      this.textOverflow,
      this.fontSize,
      this.color,
      this.fontWeight,
      this.decoration,
      this.decorationColor,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: getTextStyleMsrt(
          decorationColor: decorationColor ?? AppColors.bodyTextColor,
          textAlign: textAlign ?? TextAlign.start,
          fontSize: fontSize ?? getWidth(16),
          color: color ?? AppColors.bodyTextColor,
          fontWeight: fontWeight ?? FontWeight.w600),
      overflow: textOverflow,
      maxLines: maxLines,
    );
  }
}
