import 'package:courierapp/core/common/styles/get_text_style.dart';
import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/payment_setup_card.dart';
import 'package:courierapp/core/common/widgets/show_app_logo.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/icon_path.dart';
import 'package:courierapp/features/sender/authentication/controllers/signup_controllers/payment_setup_controller.dart';
import 'package:courierapp/features/sender/authentication/presentation/screens/sign_up_screens/payment_setup_screen2.dart';
import 'package:courierapp/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentSetupScreen extends StatelessWidget {
  PaymentSetupScreen({super.key});
  final PaymentSetupController paymentSetupController =
      Get.put(PaymentSetupController());
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
          padding: EdgeInsets.symmetric(horizontal: getWidth(12)),
          child: SizedBox(
            height: AppSizes.height,
            width: AppSizes.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerticalSpace(height: getHeight(20)),
                ShowAppLogo(),
                VerticalSpace(height: getHeight(20)),
                Text(
                  "Payment Setup",
                  style: getTextStyleMsrt(
                      color: Colors.black,
                      fontSize: getWidth(35),
                      fontWeight: FontWeight.bold),
                ),
                VerticalSpace(height: getHeight(20)),
                Text(
                  "Add payment details for easy transactions",
                  style: getTextStyleMsrt(color: Color(0xFF84828E)),
                ),
                VerticalSpace(height: getHeight(10)),
                ...List.generate(titles.length, (index) {
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
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
                              Get.toNamed(AppRoute.landingScreen);
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
                VerticalSpace(height: getHeight(20)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
