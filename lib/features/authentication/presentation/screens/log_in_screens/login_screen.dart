import 'package:courierapp/core/common/styles/get_text_style.dart';
import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/custom_text_button.dart';
import 'package:courierapp/core/common/widgets/custom_text_form_field.dart';
import 'package:courierapp/core/common/widgets/show_app_logo.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/icon_path.dart';
import 'package:courierapp/features/authentication/controllers/login_controllers/login_controller.dart';
import 'package:courierapp/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'forgot_email_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final LoginController loginController = Get.find<LoginController>();
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(); // Form key added

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: AppSizes.height,
          width: AppSizes.width,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
              child: Form(
                // Wrap fields in Form
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VerticalSpace(height: getHeight(40)),
                    ShowAppLogo(),
                    VerticalSpace(height: getHeight(40)),
                    Text(
                      "Log in",
                      style: getTextStyleMsrt(
                          color: Color(0xff262B2B),
                          fontSize: getWidth(36),
                          fontWeight: FontWeight.w700),
                    ),
                    VerticalSpace(height: getHeight(16)),
                    Text(
                      "Deliver smarter, faster, and hassle-free",
                      style: getTextStyleMsrt(
                          color: Color(0xFF677674), fontSize: getWidth(16)),
                    ),
                    VerticalSpace(height: getHeight(40)),
                    Text(
                      "Email Address",
                      style: getTextStyleMsrt(
                          color: Color(0xff262B2B),
                          fontSize: getWidth(14),
                          fontWeight: FontWeight.w700),
                    ),
                    VerticalSpace(height: getHeight(10)),
                    CustomTexFormField(
                      controller: loginController.emailController,
                      hintText: "Enter your email address",
                      validator: (value) {
                        // Add basic email validation
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }
                        return null; // Validation passed
                      },
                    ),
                    VerticalSpace(height: getHeight(20)),
                    Text(
                      "Password",
                      style: getTextStyleMsrt(
                          color: Color(0xff262B2B),
                          fontSize: getWidth(14),
                          fontWeight: FontWeight.w700),
                    ),
                    VerticalSpace(height: getHeight(10)),
                    CustomTexFormField(
                      controller: loginController.passwordController,
                      hintText: "Enter your password",
                      isPassword: true,
                      validator: (value) {
                        // Password validation
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        } else if (value.length < 8) {
                          return 'Password must be at least 8 characters';
                        }
                        return null; // Validation passed
                      },
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
                              fontWeight: FontWeight.w400,
                              color: Color(0xff677674),
                            )
                          ],
                        ),
                        CustomTextButton(
                          isUnderline: true,
                          onPressed: () {
                            Get.to(() => ForgetEmailScreen());
                          },
                          text: "Forgot Password?",
                          fontWeight: FontWeight.bold,
                          color: Color(0xff4192C4),
                        ),
                      ],
                    ),
                    Spacer(),
                    CustomButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            loginController.login();
                            //Get.toNamed(AppRoute.landingScreen);
                          }
                        },
                        child: Text(
                          "Log in",
                          style: getTextStyleMsrt(
                              color: Colors.white,
                              fontSize: getWidth(18),
                              fontWeight: FontWeight.w700),
                        )),
                    VerticalSpace(height: getHeight(16)),
                    SizedBox(
                        width: AppSizes.width,
                        child: Text(
                          "Or,",
                          style: getTextStyleMsrt(
                              color: Color(0xff677674),
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        )),
                    VerticalSpace(height: getHeight(16)),
                    CustomButton(
                        isPrimary: false,
                        onPressed: () {
                          //TODO: Google sign up
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              IconPath.googleLogo,
                              height: getHeight(20),
                              width: getWidth(20),
                            ),
                            HorizontalSpace(width: getWidth(10)),
                            CustomText(
                              text: "Login with Google",
                              fontSize: getWidth(16),
                              fontWeight: FontWeight.w700,
                              color: Color(0xff677674),
                            ),
                          ],
                        )),
                    VerticalSpace(height: getHeight(16)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: "Don't have an account?",
                          fontWeight: FontWeight.normal,
                          fontSize: getWidth(16),
                          color: Color(0xff677674),
                        ),
                        HorizontalSpace(width: getWidth(5)),
                        CustomTextButton(
                          isUnderline: true,
                          fontSize: getWidth(18),
                          onPressed: () {
                            Get.toNamed(AppRoute.signUpScreen);
                          },
                          text: "Sign Up",
                          fontWeight: FontWeight.w700,
                          color: Color(0xff003087),
                        ),
                      ],
                    ),
                    VerticalSpace(height: getHeight(16)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
