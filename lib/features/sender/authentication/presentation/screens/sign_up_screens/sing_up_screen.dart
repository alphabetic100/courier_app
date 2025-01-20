import 'package:courierapp/core/common/styles/get_text_style.dart';
import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/custom_text_button.dart';
import 'package:courierapp/core/common/widgets/custom_text_form_field.dart';
import 'package:courierapp/core/common/widgets/show_app_logo.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/features/sender/authentication/controllers/sing_up_controller.dart';
import 'package:courierapp/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingUpScreen extends StatelessWidget {
  SingUpScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final SingUpController singUpController = Get.find<SingUpController>();
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
                  "Create Your Account",
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
                VerticalSpace(height: getHeight(10)),

                //Full Name
                Text(
                  "Full Name",
                  style: getTextStyleMsrt(
                      color: AppColors.black,
                      fontSize: getWidth(18),
                      fontWeight: FontWeight.bold),
                ),
                VerticalSpace(height: getHeight(20)),
                CustomTexFormField(
                  controller: fullNameController,
                  hintText: "Enter your full name",
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

                //Email Address
                CustomTexFormField(
                  controller: emailController,
                  hintText: "Enter your email address",
                ),
                VerticalSpace(height: getHeight(20)),

                //Password
                Text(
                  "Password",
                  style: getTextStyleMsrt(
                      color: AppColors.black,
                      fontSize: getWidth(18),
                      fontWeight: FontWeight.bold),
                ),
                VerticalSpace(height: getHeight(10)),
                CustomTexFormField(
                  controller: passwordController,
                  hintText: "Enter your password",
                  isPassword: true,
                ),
                VerticalSpace(height: getHeight(20)),

                //Confirm Password
                Text(
                  "Confirm Password",
                  style: getTextStyleMsrt(
                      color: AppColors.black,
                      fontSize: getWidth(18),
                      fontWeight: FontWeight.bold),
                ),
                VerticalSpace(height: getHeight(10)),
                CustomTexFormField(
                  controller: confirmPasswordController,
                  hintText: "Enter your password again",
                  isPassword: true,
                ),
                Row(
                  children: [
                    Obx(() => Checkbox(
                        activeColor: AppColors.black,
                        value: singUpController.termsAndConditions.value,
                        onChanged: (value) {
                          singUpController.toggleTermsAndConditions();
                        })),
                    CustomText(
                      text: "I agree to the Terms & Conditions.",
                      fontSize: getWidth(16),
                      fontWeight: FontWeight.normal,
                    )
                  ],
                ),
                Spacer(),
                CustomButton(
                    onPressed: () {},
                    child: Text(
                      "Next",
                      style: getTextStyleMsrt(
                          color: Colors.white,
                          fontSize: getWidth(18),
                          fontWeight: FontWeight.bold),
                    )),
                VerticalSpace(height: getHeight(10)),
                Row(
                  children: [
                    CustomText(
                      text: "Already have an account?",
                      fontSize: getWidth(16),
                    ),
                    CustomTextButton(
                      onPressed: () {
                        Get.toNamed(AppRoute.loginScreen);
                      },
                      text: "Log in",
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
