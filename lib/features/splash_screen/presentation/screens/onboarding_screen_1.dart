import 'package:courierapp/core/common/styles/get_text_style.dart';
import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/image_path.dart';
import 'package:courierapp/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Onboarding Screen 1: Welcome to Courier App
class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            VerticalSpace(height: getHeight(30)),
            Container(
                padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                width: getWidth(250),
                child: Image.asset(ImagePath.appLogo)),
            VerticalSpace(height: getHeight(10)),
            SizedBox(
              child: Image.asset(ImagePath.onboarding1),
            ),
            VerticalSpace(height: getHeight(20)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getWidth(12)),
              child: Text(
                "Welcome to Courier App",
                style: getTextStyleMsrt(
                  fontSize: getWidth(30),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getWidth(12)),
              child: Text(
                "Send parcels or earn money by delivering—fast, secure, and collaborative.",
                style: getTextStyleMsrt(
                  color: Colors.grey,
                  fontSize: getWidth(16),
                ),
              ),
            ),
            Spacer(),
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
            ),
            VerticalSpace(height: getHeight(40))
          ],
        ),
      ),
    );
  }
}
