import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:flutter/cupertino.dart';

class ProfileTripTravelBox extends StatelessWidget {
  const ProfileTripTravelBox(
      {super.key,
      required this.title,
      required this.amount,
      this.icon,
      this.color = AppColors.black});
  final String title;
  final String amount;
  final Widget? icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Color(0xFFFAFAFC)),
      padding: EdgeInsets.symmetric(
          horizontal: getHeight(20), vertical: getHeight(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: title,
                fontWeight: FontWeight.normal,
              ),
              VerticalSpace(height: getHeight(10)),
              CustomText(
                text: amount,
                fontWeight: FontWeight.bold,
                fontSize: getWidth(25),
                color: color,
              ),
            ],
          ),
          icon ?? SizedBox.shrink()
        ],
      ),
    );
  }
}
