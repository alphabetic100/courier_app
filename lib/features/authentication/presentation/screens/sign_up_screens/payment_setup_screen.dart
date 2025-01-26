import 'package:courierapp/core/common/styles/get_text_style.dart';
import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/payment_setup_card.dart';
import 'package:courierapp/core/common/widgets/show_app_logo.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/icon_path.dart';
import 'package:courierapp/features/authentication/controllers/signup_controllers/identity_verification_controller.dart';
import 'package:courierapp/features/authentication/controllers/signup_controllers/payment_setup_controller.dart';
import 'package:courierapp/features/authentication/controllers/signup_controllers/sing_up_controller.dart';
import 'package:courierapp/features/authentication/presentation/screens/sign_up_screens/payment_setup_screen2.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentSetupScreen extends StatelessWidget {
  PaymentSetupScreen({super.key});
  final PaymentSetupController paymentSetupController =
      Get.find<PaymentSetupController>();
  final SingUpController singUpController = Get.find<SingUpController>();
  final IdentityVerificationController verificationController =
      Get.find<IdentityVerificationController>();
  final List<String> titles = ["PayPal", "Apple Pay", "Credit Card"];
  final List<String> iconPaths = [
    IconPath.payPalLogo,
    IconPath.appleLogo,
    IconPath.creditCardLogo
  ];
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
                  "Payment Setup",
                  style: getTextStyleMsrt(
                      color: Colors.black,
                      fontSize: getWidth(32),
                      fontWeight: FontWeight.bold),
                ),
                VerticalSpace(height: getHeight(20)),
                Text(
                  "Add payment details for easy transactions",
                  style: getTextStyleMsrt(
                      color: Color(0xFF84828E), fontSize: getWidth(16)),
                ),
                VerticalSpace(height: getHeight(64)),
                ...List.generate(titles.length, (index) {
                  return Padding(
                      padding: EdgeInsets.only(bottom: getHeight(16)),
                      child: Obx(() {
                        return PaymentSetupCard(
                          onTap: () {
                            paymentSetupController.selectedCard.value = index;
                          },
                          iconPath: iconPaths[index],
                          title: titles[index],
                          isCardSelected:
                              paymentSetupController.selectedCard.value == index
                                  ? true
                                  : false,
                        );
                      }));
                }),
                Spacer(),
                SizedBox(
                  width: AppSizes.width,
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                            isPrimary: false,
                            onPressed: () {
                              singUpController.signUp(
                                imagePath1: verificationController
                                    .selectedImage.value!.path,
                                imagePath2: verificationController
                                    .selfieImage.value!.path,
                                bodyData: singUpController.getRequestBody(),
                              );
                            },
                            child: CustomText(
                              text: "Skip for Now",
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      HorizontalSpace(width: getHeight(20)),
                      Expanded(
                        child: CustomButton(
                            onPressed: () {
                              Get.to(PaymentSetupScreen2());
                            },
                            child: CustomText(
                              text: "Next",
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ],
                  ),
                ),
                VerticalSpace(height: getHeight(16)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
