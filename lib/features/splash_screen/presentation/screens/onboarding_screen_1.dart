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

// Onboarding Screen 1: Welcome to Courier App
class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                VerticalSpace(height: getHeight(30)),
                Padding(
                  padding: EdgeInsets.only(left: getWidth(16)),
                  child: ShowAppLogo(),
                ),
                VerticalSpace(height: getHeight(16)),
                SizedBox(
                  child: Image.asset(
                    ImagePath.onboarding1,
                    height: getHeight(390),
                    width: getWidth(522),
                    fit: BoxFit.cover,
                  ),
                ),
                VerticalSpace(height: getHeight(24)),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
                    child: Text(
                      "Welcome to Courier App",
                      style: getTextStyleMsrt(
                          fontSize: getWidth(32),
                          fontWeight: FontWeight.w700,
                          color: Color(0xff262B2B)),
                    ),
                  ),
                ),
                VerticalSpace(height: getHeight(16)),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
                    child: Text(
                      "Send parcels or earn money by delivering—fast, secure, and collaborative.",
                      style: getTextStyleMsrt(
                          color: Color(0xFF677674),
                          fontSize: getWidth(16),
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  width: AppSizes.width,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.symmetric(
                      horizontal: getWidth(16), vertical: getHeight(16)),
                  child: CustomButton(
                      width: getWidth(44),
                      onPressed: () {
                        Get.toNamed(AppRoute.onboarding2);
                      },
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.white,
                      )),
                ),
                SizedBox(height: getHeight(16)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
