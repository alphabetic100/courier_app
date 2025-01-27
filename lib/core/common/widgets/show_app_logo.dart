import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/image_path.dart';
import 'package:flutter/material.dart';

class ShowAppLogo extends StatelessWidget {
  const ShowAppLogo({
    super.key,
    this.height,
    this.width,
    this.alignment,
  });
  final double? height;
  final double? width;
  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSizes.width,
      child: Container(
        // height: height ?? getHeight(40),
        // width: width ?? getWidth(245),
        alignment: alignment ?? Alignment.centerLeft,
        child: Image.asset(
          ImagePath.appLogo,
          height: getHeight(55),
          width: getWidth(245),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
