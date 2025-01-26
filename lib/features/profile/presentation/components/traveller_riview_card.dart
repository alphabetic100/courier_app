import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class TravellerRiviewCard extends StatelessWidget {
  const TravellerRiviewCard(
      {super.key,
      required this.profileUrl,
      required this.userName,
      required this.ratting,
      required this.review});
  final String profileUrl;
  final String userName;
  final String ratting;
  final String review;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Column(
        children: [
          CircleAvatar(
            radius: getWidth(15),
            backgroundImage: AssetImage(profileUrl),
          ),
        ],
      ),
      title: Row(
        children: [
          CustomText(
            text: userName,
            fontSize: getWidth(16),
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
          SizedBox(
              height: getHeight(15),
              child: VerticalDivider(
                color: AppColors.black,
                thickness: 2,
              )),
          CustomText(
            text: ratting,
            fontSize: getWidth(14),
            color: AppColors.black,
            fontWeight: FontWeight.normal,
          )
        ],
      ),
      subtitle: CustomText(
        text: review,
        fontSize: getWidth(14),
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
