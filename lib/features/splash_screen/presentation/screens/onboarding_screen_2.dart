import 'package:courierapp/core/common/styles/get_text_style.dart';
import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/image_path.dart';
import 'package:courierapp/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Onboarding Screen 2: Post Parcels Easily
class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
              width: getWidth(250),
              child: Image.asset(ImagePath.appLogo)),
          VerticalSpace(height: getHeight(30)),
          SizedBox(
            child: Image.asset(ImagePath.onboarding2),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getWidth(12)),
            child: Text(
              "Post Parcels Easily",
              style: getTextStyleMsrt(
                fontSize: getWidth(30),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          VerticalSpace(height: getHeight(20)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getWidth(12)),
            child: Text(
              "Share parcel details, choose a traveler, and track your delivery step-by-step.",
              style: getTextStyleMsrt(
                color: Colors.grey,
                fontSize: getWidth(16),
              ),
            ),
          ),
          VerticalSpace(height: getHeight(150)),
          Container(
            width: AppSizes.width,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
            child: CustomButton(
                width: getWidth(44),
                onPressed: () {
                  Get.toNamed(
                    AppRoute.landingScreen,
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
