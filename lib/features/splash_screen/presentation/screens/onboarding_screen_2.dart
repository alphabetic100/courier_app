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

// Onboarding Screen 2: Post Parcels Easily
class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key});

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
              //  mainAxisAlignment: MainAxisAlignment.center,
              children: [
                VerticalSpace(height: getHeight(40)),
                Padding(
                    padding: EdgeInsets.only(left: getWidth(16)),
                    child: ShowAppLogo()),
                VerticalSpace(height: getHeight(16)),
                SizedBox(
                  child: Image.asset(ImagePath.onboarding2,height: getHeight(390),width: getWidth(522),fit: BoxFit.cover,),
                ),
                VerticalSpace(height: getHeight(24)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
                  child: Text(
                    "Post Parcels Easily",
                    style: getTextStyleMsrt(
                      fontSize: getWidth(32),
                      fontWeight: FontWeight.w700,
                      color: Color(0xff262B2B)
                    ),
                  ),
                ),
                    VerticalSpace(height: getHeight(16)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
                  child: Text(
                    "Share parcel details, choose a traveler, and track your delivery step-by-step.",
                    style: getTextStyleMsrt(
                      color: Color(0xFF677674),
                      fontSize: getWidth(16),
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  width: AppSizes.width,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
                  child: CustomButton(
                      width: getWidth(44),
                      onPressed: () {
                        Get.toNamed(
                          AppRoute.onboarding3,
                        );
                      },
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.white,
                      )),
                ),
                VerticalSpace(height: getHeight(16)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
