import 'package:courierapp/core/common/styles/get_text_style.dart';
import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/custom_text_form_field.dart';
import 'package:courierapp/core/common/widgets/show_app_logo.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/features/sender/authentication/presentation/screens/log_in_screens/reset_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getWidth(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VerticalSpace(height: getHeight(20)),
            ShowAppLogo(),
            VerticalSpace(height: getHeight(20)),
            Text(
              "Password reset",
              style: getTextStyleMsrt(
                  color: Colors.black,
                  fontSize: getWidth(35),
                  fontWeight: FontWeight.bold),
            ),
            VerticalSpace(height: getHeight(20)),
            Text(
              "Please enter the OTP that has been sent to your registered email address.",
              style: getTextStyleMsrt(color: Color(0xFF84828E)),
            ),
            VerticalSpace(height: getHeight(30)),
            CustomText(
              text: "OTP",
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
            VerticalSpace(height: getHeight(20)),
            CustomTexFormField(hintText: "Enter The otp"),
            Spacer(),
            CustomButton(
                onPressed: () {
                  Get.to(() => ResetPasswordScreen());
                },
                child: CustomText(
                    text: "Next",
                    fontSize: 18,
                    color: AppColors.white,
                    fontWeight: FontWeight.bold)),
            VerticalSpace(height: getHeight(20))
          ],
        ),
      )),
    );
  }
}
