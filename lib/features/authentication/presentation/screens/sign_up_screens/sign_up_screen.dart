import 'package:courierapp/core/common/styles/get_text_style.dart';
import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/custom_text_button.dart';
import 'package:courierapp/core/common/widgets/custom_text_form_field.dart';
import 'package:courierapp/core/common/widgets/error_snakbar.dart';
import 'package:courierapp/core/common/widgets/phone_number_text_field.dart';
import 'package:courierapp/core/common/widgets/show_app_logo.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/icon_path.dart';
import 'package:courierapp/features/authentication/controllers/signup_controllers/sing_up_controller.dart';
import 'package:courierapp/features/authentication/services/google_auth/google_auth_service.dart';
import 'package:courierapp/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final SingUpController singUpController = Get.find<SingUpController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: AppSizes.height,
        width: AppSizes.width,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
            child: SafeArea(
              child: Form(
                key: _formKey, // Add form key here
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    VerticalSpace(height: getHeight(40)),
                    ShowAppLogo(),
                    VerticalSpace(height: getHeight(40)),
                    Text(
                      "Create Your Account",
                      style: getTextStyleMsrt(
                          color: Colors.black,
                          fontSize: getWidth(32),
                          fontWeight: FontWeight.bold),
                    ),
                    VerticalSpace(height: getHeight(16)),
                    Text(
                      "Deliver smarter, faster, and hassle-free",
                      style: getTextStyleMsrt(
                          color: Color(0xFF84828E), fontSize: getWidth(16)),
                    ),
                    VerticalSpace(height: getHeight(30)),
                    Text(
                      "Full Name",
                      style: getTextStyleMsrt(
                          color: Color(0xff262B2B),
                          fontSize: getWidth(14),
                          fontWeight: FontWeight.w600),
                    ),
                    VerticalSpace(height: getHeight(8)),
                    CustomTexFormField(
                      controller: singUpController.fullNameController,
                      hintText: "Enter your full name",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Full Name is required";
                        }
                        return null;
                      },
                    ),
                    VerticalSpace(height: getHeight(16)),
                    Text(
                      "Phone Number",
                      style: getTextStyleMsrt(
                          color: AppColors.black,
                          fontSize: getWidth(14),
                          fontWeight: FontWeight.w600),
                    ),
                    VerticalSpace(height: getHeight(8)),
                    PhoneNumberTextField(
                      hintText: "Enter your phone number",
                      controller: singUpController.phoneNumberController,
                      onChange: (value) {
                        // Handle changes if needed
                      },
                      // Optional custom validator
                      validator: (value) {
                        // Your custom validation logic
                        return null;
                      },
                    ),
                    VerticalSpace(height: getHeight(16)),
                    Text(
                      "Email Address",
                      style: getTextStyleMsrt(
                          color: AppColors.black,
                          fontSize: getWidth(14),
                          fontWeight: FontWeight.w600),
                    ),
                    VerticalSpace(height: getHeight(8)),
                    CustomTexFormField(
                      controller: singUpController.emailController,
                      hintText: "Enter your email address",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email Address is required";
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return "Enter a valid email address";
                        }
                        return null;
                      },
                    ),
                    VerticalSpace(height: getHeight(16)),
                    Text(
                      "Password",
                      style: getTextStyleMsrt(
                          color: AppColors.black,
                          fontSize: getWidth(14),
                          fontWeight: FontWeight.w600),
                    ),
                    VerticalSpace(height: getHeight(8)),
                    CustomTexFormField(
                      controller: singUpController.passwordController,
                      hintText: "Enter your password",
                      isPassword: true,
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
                    VerticalSpace(height: getHeight(16)),
                    Text(
                      "Confirm Password",
                      style: getTextStyleMsrt(
                          color: AppColors.black,
                          fontSize: getWidth(14),
                          fontWeight: FontWeight.bold),
                    ),
                    VerticalSpace(height: getHeight(8)),
                    CustomTexFormField(
                      controller: singUpController.confirmPasswordController,
                      hintText: "Enter your password again",
                      isPassword: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Confirm Password is required";
                        }
                        if (value != singUpController.passwordController.text) {
                          return "Passwords do not match";
                        }
                        return null;
                      },
                    ),
                    VerticalSpace(height: getHeight(8)),
                    Row(
                      children: [
                        Obx(() => Checkbox(
                            activeColor: AppColors.black,
                            value: singUpController.termsAndConditions.value,
                            onChanged: (value) {
                              singUpController.toggleTermsAndConditions();
                            })),
                        Row(children: [
                          CustomText(
                            text: "I agree to the",
                            fontSize: getWidth(14),
                            fontWeight: FontWeight.normal,
                            color: AppColors.bodyTextColor,
                          ),
                          HorizontalSpace(width: getWidth(5)),
                          CustomTextButton(
                            isUnderline: false,
                            onPressed: () {
                              // TODO: Go to the terms and conditions screen
                            },
                            text: "Terms & Conditions.",
                            fontWeight: FontWeight.bold,
                          )
                        ])
                      ],
                    ),
                    VerticalSpace(height: getHeight(40)),
                    CustomButton(
                        onPressed: () {
                          if (!singUpController.termsAndConditions.value) {
                            errorSnakbar(
                                errorMessage:
                                    "Please read the terms & conditions");
                            return;
                          }
                          if (_formKey.currentState!.validate()) {
                            Get.toNamed(AppRoute.identityVerificationScreen1);
                          }
                        },
                        child: Text(
                          "Sign Up",
                          style: getTextStyleMsrt(
                              color: Colors.white,
                              fontSize: getWidth(18),
                              fontWeight: FontWeight.bold),
                        )),
                    VerticalSpace(height: getHeight(16)),
                    SizedBox(
                        width: AppSizes.width,
                        child: Text(
                          "Or,",
                          style: getTextStyleMsrt(
                              color: AppColors.bodyTextColor,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        )),
                    VerticalSpace(height: getHeight(16)),
                    CustomButton(
                        isPrimary: false,
                        onPressed: () async {
                          //TODO: Google sign up
                          await signUpWithGoogle();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              IconPath.googleLogo,
                              height: getHeight(25),
                            ),
                            HorizontalSpace(width: getWidth(10)),
                            CustomText(
                              text: "Sign Up with Google",
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        )),
                    VerticalSpace(height: getHeight(16)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: "Already have an account?",
                          fontWeight: FontWeight.normal,
                          fontSize: getWidth(16),
                        ),
                        HorizontalSpace(width: getWidth(5)),
                        CustomTextButton(
                          isUnderline: true,
                          fontSize: 18,
                          onPressed: () {
                            Get.toNamed(AppRoute.loginScreen);
                          },
                          text: "Log in",
                          fontWeight: FontWeight.bold,
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
