import 'package:courierapp/core/common/styles/get_text_style.dart';
import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/custom_text_button.dart';
import 'package:courierapp/core/common/widgets/custom_text_form_field.dart';
import 'package:courierapp/core/common/widgets/show_app_logo.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/features/authentication/controllers/signup_controllers/sing_up_controller.dart';
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
                          color: AppColors.black,
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
                    CustomTexFormField(
                      controller: singUpController.phoneNumberController,
                      hintText: "Enter your phone number",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Phone Number is required";
                        }
                        if (!RegExp(r'^\d{10,}$').hasMatch(value)) {
                          return "Enter a valid phone number";
                        }
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
                            Get.snackbar(
                                "Error", "Please reat the terms & conditions");
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
                    // Remaining content
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
