import 'package:courierapp/core/common/styles/get_text_style.dart';
import 'package:courierapp/core/common/widgets/payment_setup_card.dart';
import 'package:courierapp/core/common/widgets/show_app_logo.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/icon_path.dart';
import 'package:courierapp/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentSetupScreen extends StatelessWidget {
  const PaymentSetupScreen({super.key});

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
                ...List.generate(3, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PaymentSetupCard(
                      onTap: () {
                        Get.toNamed(AppRoute.paymentSetupScreen);
                      },
                      iconPath: IconPath.payPalLogo,
                      title: "Visa",
                      isCardSelected: false,
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
