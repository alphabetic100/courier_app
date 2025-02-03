import 'package:courierapp/core/common/styles/get_text_style.dart';
import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/show_app_logo.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/features/authentication/controllers/login_controllers/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ForgetPasswordScreen extends StatelessWidget {
  final String email;
  ForgetPasswordScreen({super.key, required this.email});
  final OtpController controller = OtpController();
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
              "Please enter the OTP that has been sent to your registered email address.",
              style: getTextStyleMsrt(
                  color: Color(0xFF84828E), fontSize: getWidth(16)),
            ),
            VerticalSpace(height: getHeight(20)),
            CustomText(
              text: "Enter the OTP",
              fontSize: getWidth(14),
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
            VerticalSpace(height: getHeight(10)),
            PinCodeTextField(
              backgroundColor: AppColors.white,
              appContext: context,
              length: 6,
              onChanged: (value) {},
              controller: controller.otpController,
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
            Spacer(),
            CustomButton(
                onPressed: () {
                  controller.verifyOTP(email);
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
