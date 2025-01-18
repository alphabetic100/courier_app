import 'package:courierapp/core/common/styles/get_text_style.dart';
import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/image_path.dart';
import 'package:courierapp/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen3 extends StatelessWidget {
  const OnboardingScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: 250,
              child: Image.asset(ImagePath.appLogo)),
          SizedBox(
            child: Image.asset(ImagePath.onboarding3),
          ),
          VerticalSpace(height: getHeight(20)),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                "Earn While You Travel",
                style: getTextStyleMsrt(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              )),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                "Browse available parcels, accept deliveries, and earn money effortlessly.",
                style: getTextStyleMsrt(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              )),
          VerticalSpace(height: getHeight(150)),
          Container(
            width: AppSizes.width,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
            child: CustomButton(
                width: getWidth(44),
                onPressed: () {
                  Get.toNamed(
                    AppRoute.onboarding2,
                  );
                },
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.white,
                )),
          )
        ],
      ),
    );
  }
}
