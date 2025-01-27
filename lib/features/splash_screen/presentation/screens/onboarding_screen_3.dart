import 'package:courierapp/core/common/styles/get_text_style.dart';
import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/show_app_logo.dart';
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
      body: SingleChildScrollView(
        child: SizedBox(
          height: AppSizes.height,
          width: AppSizes.width,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                VerticalSpace(height: getHeight(40)),
                Padding(
                    padding: EdgeInsets.only(left: getWidth(16)),
                    child: ShowAppLogo()),
                VerticalSpace(height: getHeight(16)),
                SizedBox(
                  child: Image.asset(ImagePath.onboarding3),
                ),
                VerticalSpace(height: getHeight(26)),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Earn While You Travel",
                      style: getTextStyleMsrt(
                        fontSize: getWidth(32),
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                VerticalSpace(height: getHeight(16)),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Browse available parcels, accept deliveries, and earn money effortlessly.",
                      style: getTextStyleMsrt(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    )),
                Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: CustomButton(
                      onPressed: () {
                        Get.toNamed(AppRoute.loginScreen);
                      },
                      child: Text(
                        "Log In",
                        style: getTextStyleMsrt(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
                VerticalSpace(height: getHeight(16)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: CustomButton(
                      isPrimary: false,
                      onPressed: () {
                        Get.toNamed(AppRoute.signUpScreen);
                      },
                      child: Text(
                        "Sign Up",
                        style: getTextStyleMsrt(
                          color: AppColors.bodyTextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
                VerticalSpace(height: getHeight(16))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
