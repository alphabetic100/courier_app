import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:flutter/material.dart';

class CreateTripTopBody extends StatelessWidget {
  const CreateTripTopBody({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFAFAFC),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VerticalSpace(height: getHeight(10)),
          Padding(
            padding: EdgeInsets.only(left: getWidth(16)),
            child: CustomText(
              text: title,
              fontSize: getWidth(25),
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
          VerticalSpace(height: getHeight(20)),
          Divider(
            color: Color(0xffCCD9D6),
            height: getHeight(1),
          ),
          VerticalSpace(height: getHeight(25))
        ],
      ),
    );
  }
}
