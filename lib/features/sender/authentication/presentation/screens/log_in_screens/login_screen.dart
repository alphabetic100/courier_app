import 'package:courierapp/core/common/styles/get_text_style.dart';
import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/custom_text_button.dart';
import 'package:courierapp/core/common/widgets/custom_text_form_field.dart';
import 'package:courierapp/core/common/widgets/show_app_logo.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/features/sender/authentication/controllers/login_controller.dart';
import 'package:courierapp/features/sender/authentication/presentation/screens/log_in_screens/forget_password_screen.dart';
import 'package:courierapp/routes/app_routes.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final LoginController loginController = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getWidth(12)),
          child: SizedBox(
            height: AppSizes.height,
            width: AppSizes.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                VerticalSpace(height: getHeight(20)),
                ShowAppLogo(),
                VerticalSpace(height: getHeight(20)),
                Text(
                  "Log in",
                  style: getTextStyleMsrt(
                      color: Colors.black,
                      fontSize: getWidth(35),
                      fontWeight: FontWeight.bold),
                ),
                VerticalSpace(height: getHeight(20)),
                Text(
                  "Deliver smarter, faster, and hassle-free",
                  style: getTextStyleMsrt(color: Color(0xFF84828E)),
                ),
                VerticalSpace(height: getHeight(20)),
                Text(
                  "Email Address",
                  style: getTextStyleMsrt(
                      color: AppColors.black,
                      fontSize: getWidth(18),
                      fontWeight: FontWeight.bold),
                ),
                VerticalSpace(height: getHeight(10)),
                CustomTexFormField(
                  hintText: "Enter your email address",
                ),
                VerticalSpace(height: getHeight(20)),
                Text(
                  "Password",
                  style: getTextStyleMsrt(
                      color: AppColors.black,
                      fontSize: getWidth(18),
                      fontWeight: FontWeight.bold),
                ),
                VerticalSpace(height: getHeight(10)),
                CustomTexFormField(
                  hintText: "Enter your password",
                  isPassword: true,
                ),
                VerticalSpace(height: getHeight(20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Obx(() => Checkbox(
                              value: loginController.rememberMe.value,
                              onChanged: (value) {
                                loginController.toggleRememberMe();
                              },
                              activeColor: AppColors.black,
                            )),
                        CustomText(
                          text: "Remember me",
                          fontSize: getWidth(16),
                        )
                      ],
                    ),
                    CustomTextButton(
                      onPressed: () {
                        Get.to(() => ForgetPasswordScreen());
                      },
                      text: "Forgot Password?",
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                VerticalSpace(height: AppSizes.height * 0.3),
                Spacer(),
                CustomButton(
                    onPressed: () {
                      loginController.login();
                    },
                    child: Text(
                      "Log in",
                      style: getTextStyleMsrt(
                          color: Colors.white,
                          fontSize: getWidth(18),
                          fontWeight: FontWeight.bold),
                    )),
                VerticalSpace(height: getHeight(10)),
                Row(
                  children: [
                    CustomText(
                      text: "Don't have an account?",
                      fontSize: getWidth(16),
                    ),
                    CustomTextButton(
                      onPressed: () {
                        Get.toNamed(AppRoute.signUpScreen);
                      },
                      text: "Sign up",
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                VerticalSpace(height: getHeight(20)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
