import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:flutter/cupertino.dart';

class ProfileDetailsCard extends StatelessWidget {
  const ProfileDetailsCard(
      {super.key, required this.title, required this.subtitle, this.color});
  final String title;
  final String subtitle;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(
          text: title,
          color: AppColors.black,
          fontSize: getWidth(16),
        ),
        HorizontalSpace(width: getWidth(5)),
        CustomText(
          text: subtitle,
          color: color,
          fontWeight: FontWeight.normal,
          fontSize: getWidth(14),
        )
      ],
    );
  }
}
