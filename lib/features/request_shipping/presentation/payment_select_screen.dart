import 'package:courierapp/core/common/widgets/custom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_bottom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/custom_text_form_field.dart';
import 'package:courierapp/core/common/widgets/message_notification_box.dart';
import 'package:courierapp/core/common/widgets/show_payment_success_dialog.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/icon_path.dart';
import 'package:courierapp/features/authentication/controllers/signup_controllers/payment_setup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentSelectScreen extends StatelessWidget {
  PaymentSelectScreen({super.key, });
  final PaymentSetupController paymentSetupController =
      Get.find<PaymentSetupController>();
 

  final List<String> titles = ["PayPal", "Apple Pay", "Credit Card"];
  final List<String> iconPaths = [
    IconPath.payPalLogo,
    IconPath.appleLogo,
    IconPath.creditCardLogo
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: Color(0xffFAFAFC),
        actions: [
          Padding(
            padding: EdgeInsets.only(
                right: getWidth(12), top: getHeight(6), bottom: getHeight(6)),
            child: MessageNotificationBox(),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Color(0xffFAFAFC),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerticalSpace(height: getHeight(10)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
                  child: CustomText(
                    text: "Payment Method",
                    fontSize: getWidth(25),
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                VerticalSpace(height: getHeight(20)),
                Container(
                  height: getHeight(1),
                  width: double.infinity,
                  color: Color(0xffCCD9D6),
                ),
              ],
            ),
          ),
          SizedBox(
            height: getHeight(8),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                CustomTextAndTextFormField(
                  text: "Card Name",
                  hintText: "Enter your card name",
                ),
                SizedBox(
                  height: getHeight(16),
                ),
                CustomTextAndTextFormField(
                  text: "Card Number",
                  hintText: "Enter your card number",
                ),
                SizedBox(
                  height: getHeight(16),
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextAndTextFormField(
                        text: "Expiry Date",
                        hintText: "MM/YY",
                      ),
                    ),
                    HorizontalSpace(width: getWidth(16)),
                    Expanded(
                      child: CustomTextAndTextFormField(
                        text: "CVV",
                        hintText: "CVV",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: getHeight(16),
                ),
                Obx(() => Row(
                      children: [
                        Checkbox(
                          fillColor: WidgetStateProperty.all(Color(0xff677674)),
                          checkColor: Colors.white,
                          value: paymentSetupController.isChecked.value,
                          onChanged: (newValue) {
                            paymentSetupController.toggleCheckbox();
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                2), // Optional: if you want rounded corners
                            side: BorderSide(
                                color: Colors.white,
                                width: 2), // Sets the border color and width
                          ),
                        ),
                        GestureDetector(
                          onTap: () => paymentSetupController.toggleCheckbox(),
                          child: Text("Save this card for future use",
                              style: TextStyle(fontSize: 16)),
                        )
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomAppBar(
          primaryText: "Pay",
          onTap: () {
            // Get.to(() => PaymentMethodScreen());
            showDialog(
                context: context,
                builder: (context) {
                  return ShowPaymentSuccessDialog();
                });
          },
          secondaryWidget: Row(
            children: [
              Text("\$",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondaryColor)),
              HorizontalSpace(width: getWidth(10)),
              Expanded(
                child: CustomText(
                  text:
                      "You will be refunded if your courier does not accept your order",
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          isPrimaryButton: true),
    );
  }
}

class CustomTextAndTextFormField extends StatelessWidget {
  const CustomTextAndTextFormField({
    super.key,
    required this.text,
    required this.hintText,
    this.controller,
  });
  final String text, hintText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: text,
          color: Color(0xff262B2B),
          fontWeight: FontWeight.bold,
          fontSize: getWidth(16),
        ),
        SizedBox(
          height: getHeight(8),
        ),
        CustomTexFormField(
          hintText: hintText,
          controller: controller,
        ),
      ],
    );
  }
}
