import 'package:courierapp/core/common/styles/get_text_style.dart';
import 'package:courierapp/core/common/widgets/custom_bottom_app_bar.dart';
import 'package:courierapp/core/common/widgets/show_app_logo.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/features/authentication/controllers/signup_controllers/identity_verification_controller.dart';
import 'package:courierapp/features/authentication/controllers/signup_controllers/payment_setup_controller.dart';
import 'package:courierapp/features/authentication/controllers/signup_controllers/sing_up_controller.dart';
import 'package:courierapp/features/landing/presentation/screens/landing_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetStartedScreen extends StatelessWidget {
  GetStartedScreen({super.key});
  final PaymentSetupController paymentSetupController =
      Get.find<PaymentSetupController>();
  final SingUpController singUpController = Get.find<SingUpController>();
  final IdentityVerificationController verificationController =
      Get.find<IdentityVerificationController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
          child: SizedBox(
            height: AppSizes.height,
            width: AppSizes.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerticalSpace(height: getHeight(40)),
                ShowAppLogo(),
                VerticalSpace(height: getHeight(40)),
                Text(
                  "Your account has been created successfully!",
                  style: getTextStyleMsrt(
                      color: Colors.black,
                      fontSize: getWidth(32),
                      fontWeight: FontWeight.bold),
                ),
                VerticalSpace(height: getHeight(20)),
                Text(
                  "Now you can send shipments or earn money as a courier.",
                  style: getTextStyleMsrt(
                      color: Color(0xFF677674), fontSize: getWidth(16)),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(
        isPrimaryButton: true,
        onTap: () {
          Get.offAll(() => LandingScreen());
        },
        primaryText: "Get Started",
      ),
    );
  }
}
