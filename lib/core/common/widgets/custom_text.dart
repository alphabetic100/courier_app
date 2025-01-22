import 'package:courierapp/core/common/styles/get_text_style.dart';
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
  const CustomText(
      {super.key,
      required this.text,
      this.maxLines,
      this.textOverflow,
      this.fontSize,
      this.color,
      this.fontWeight,
      this.decoration,
      this.decorationColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: getTextStyleMsrt(
          decorationColor: decorationColor ?? const Color(0xffA59F92),
          fontSize: fontSize ?? getWidth(16),
          color: color ?? Color(0xff9CA3AF),
          fontWeight: fontWeight ?? FontWeight.w600),
      overflow: textOverflow,
      maxLines: maxLines,
    );
  }
}
