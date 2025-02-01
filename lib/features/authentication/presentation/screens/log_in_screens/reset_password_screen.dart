import 'package:courierapp/core/common/styles/get_text_style.dart';
import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/custom_text_form_field.dart';
import 'package:courierapp/core/common/widgets/show_app_logo.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/login_controllers/reset_password_controller.dart';
import 'login_screen.dart';

class ResetPasswordScreen extends StatelessWidget {
  final String email;
  ResetPasswordScreen({super.key, required this.email});

  final controller = Get.put(NewPasswordController());
  final GlobalKey<FormState> _resetPasswordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VerticalSpace(height: getHeight(40)),
            ShowAppLogo(),
            VerticalSpace(height: getHeight(40)),
            Text(
              "Password reset",
              style: getTextStyleMsrt(
                  color: Colors.black,
                  fontSize: getWidth(32),
                  fontWeight: FontWeight.bold),
            ),
            VerticalSpace(height: getHeight(16)),
            Text(
              "Create a new password to access your account.",
              style: getTextStyleMsrt(
                  color: Color(0xFF84828E),
                  fontSize: getWidth(16),
                  fontWeight: FontWeight.w400),
            ),
            VerticalSpace(height: getHeight(20)),
            Form(
              key: _resetPasswordFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "New Password",
                    fontSize: getWidth(14),
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                  VerticalSpace(height: getHeight(10)),
                  CustomTexFormField(
                    controller: controller.passwordTEController,
                    isPassword: true,
                    hintText: "Enter your new password",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      }
                      if (value.length < 6) {
                        return "Password must be at least 6 characters long";
                      }
                      return null;
                    },
                  ),
                  VerticalSpace(height: getHeight(20)),
                  CustomText(
                    text: "Confirm Password",
                    fontSize: getWidth(14),
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ],
              ),
            ),
            VerticalSpace(height: getHeight(10)),
            CustomTexFormField(
              controller: controller.confirmPasswordTEController,
              isPassword: true,
              hintText: "Confirm your new password",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Confirm Password is required";
                }
                if (value != controller.passwordTEController.text) {
                  return "Passwords do not match";
                }
                return null;
              },
            ),
            Spacer(),
            CustomButton(
                onPressed: () {
                  if (_resetPasswordFormKey.currentState!.validate()) {
                    controller.createNewPassword(email);
                  }

                  //Get.offAll(() => LoginScreen());
                },
                child: CustomText(
                    text: "Next",
                    fontSize: getWidth(18),
                    color: AppColors.white,
                    fontWeight: FontWeight.bold)),
            VerticalSpace(height: getHeight(16))
          ],
        ),
      )),
    );
  }
}
