import 'package:courierapp/core/common/styles/get_text_style.dart';
import 'package:courierapp/core/common/widgets/create_trip_top_body.dart';
import 'package:courierapp/core/common/widgets/custom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_bottom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../controller/forgot_email_and_otp_controller.dart';

class ChangePasswordOtpScreen extends StatelessWidget {
  final String email;
  const ChangePasswordOtpScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(ForgotEmailAndOtpController());
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          CreateTripTopBody(title: "Password reset"),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
            child: Column(
              children: [
                VerticalSpace(height: getHeight(10)),
                CustomText(
                  text:
                      "Please enter the code that has been sent to your registered email address.",
                  fontSize: getWidth(15),
                  fontWeight: FontWeight.normal,
                ),
                VerticalSpace(height: getHeight(20)),
                Row(
                  children: [
                    CustomText(
                      text: "Enter the Code",
                      color: AppColors.black,
                      fontSize: getWidth(15),
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                VerticalSpace(height: getHeight(10)),
                PinCodeTextField(
                  controller: controller.otpController,
                  backgroundColor: AppColors.white,
                  appContext: context,
                  length: 6,
                  onChanged: (value) {},
                  //  controller: controller.otpController,
                  pinTheme: PinTheme(
                    activeFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                    shape: PinCodeFieldShape.box,
                    borderWidth: 1.5,
                    borderRadius: BorderRadius.circular(8),
                    fieldHeight: 50,
                    fieldWidth: 50,
                    inactiveFillColor: Colors.white,
                    activeColor: AppColors.primaryColor,
                    selectedColor: AppColors.primaryColor, //
                    inactiveColor: Color(0xFFE0E0E0),
                  ),
                  cursorColor: Color(0xFF007AFF),
                  keyboardType: TextInputType.number,
                  enableActiveFill: true,
                  textStyle: getTextStyleMsrt(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: CustomBottomAppBar(
          isPrimaryButton: true,
          onTap: () {
            controller.verifyOTP(email);

          }),
    );
  }
}
