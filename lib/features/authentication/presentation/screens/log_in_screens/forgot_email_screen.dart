import 'package:courierapp/core/common/styles/get_text_style.dart';
import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/show_app_logo.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/common/widgets/custom_text_form_field.dart';
import '../../../controllers/signup_controllers/sing_up_controller.dart';
import 'forget_password_screen.dart';

class ForgetEmailScreen extends StatelessWidget {
  ForgetEmailScreen({super.key});
  final SingUpController singUpController = Get.find<SingUpController>();
  final _forgetEmailFormKey = GlobalKey<FormState>();
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
                  "Forget Password!",
                  style: getTextStyleMsrt(
                      color: Colors.black,
                      fontSize: getWidth(32),
                      fontWeight: FontWeight.bold),
                ),
                VerticalSpace(height: getHeight(16)),
                Text(
                  "Please enter your registered email address to receive your OTP.",
                  style: getTextStyleMsrt(
                      color: Color(0xFF84828E), fontSize: getWidth(16)),
                ),
                VerticalSpace(height: getHeight(20)),
                CustomText(
                  text: "Email Address",
                  fontSize: getWidth(14),
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
                VerticalSpace(height: getHeight(10)),
                Form(
                  key: _forgetEmailFormKey,
                  child: CustomTexFormField(

                    controller: singUpController.forgotEmailController,
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
                ),
                Spacer(),
                CustomButton(
                    onPressed: () {
                      if(_forgetEmailFormKey.currentState!.validate()){
                        Get.to(() => ForgetPasswordScreen());
                      }

                    },
                    child: CustomText(
                        text: "Next",
                        fontSize: 18,
                        color: AppColors.white,
                        fontWeight: FontWeight.bold)),
                VerticalSpace(height: getHeight(16))
              ],
            ),
          )),
    );
  }
}
