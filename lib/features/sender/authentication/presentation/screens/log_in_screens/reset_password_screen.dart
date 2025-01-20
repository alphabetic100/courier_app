import 'package:courierapp/core/common/styles/get_text_style.dart';
import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/custom_text_form_field.dart';
import 'package:courierapp/core/common/widgets/show_app_logo.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

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
              "Create a new password to access your account.",
              style: getTextStyleMsrt(color: Color(0xFF84828E)),
            ),
            VerticalSpace(height: getHeight(30)),
            CustomText(
              text: "New Password",
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
            VerticalSpace(height: getHeight(10)),
            CustomTexFormField(
                controller: newPasswordController,
                isPassword: true,
                hintText: "Enter your new password"),
            VerticalSpace(height: getHeight(20)),
            CustomText(
              text: "Confirm Password",
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
            VerticalSpace(height: getHeight(10)),
            CustomTexFormField(
                controller: confirmPasswordController,
                isPassword: true,
                hintText: "Confirm your new password"),
            Spacer(),
            CustomButton(
                onPressed: () {},
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
