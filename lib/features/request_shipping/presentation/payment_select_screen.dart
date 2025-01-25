import 'package:courierapp/core/common/widgets/custom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_bottom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/message_notification_box.dart';
import 'package:courierapp/core/common/widgets/payment_setup_card.dart';
import 'package:courierapp/core/common/widgets/trip_details_top_body.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/icon_path.dart';
import 'package:courierapp/features/authentication/controllers/signup_controllers/payment_setup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentSelectScreen extends StatelessWidget {
  PaymentSelectScreen({super.key});
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
        actions: [
          Padding(
            padding: EdgeInsets.only(
                right: getWidth(12), top: getHeight(6), bottom: getHeight(6)),
            child: MessageNotificationBox(),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getWidth(12)),
        child: Column(
          children: [
            TripDetailsTopBody(title: "Payment Method"),
            ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                padding: EdgeInsets.all(8),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: getHeight(10)),
                    child: Obx(
                      () {
                        return PaymentSetupCard(
                            onTap: () {
                              paymentSetupController.selectedCard.value = index;
                            },
                            iconPath: iconPaths[index],
                            title: titles[index],
                            isCardSelected:
                                paymentSetupController.selectedCard.value ==
                                    index);
                      },
                    ),
                  );
                }),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(
          onTap: () {},
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
