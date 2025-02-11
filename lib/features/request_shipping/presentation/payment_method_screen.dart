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
import 'package:courierapp/core/utils/helpers/app_helper.dart';
import 'package:courierapp/features/authentication/controllers/signup_controllers/payment_setup_controller.dart';
import 'package:courierapp/features/request_shipping/presentation/payment_select_screen.dart';
import 'package:courierapp/features/search_screen/models/all_trip_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentMethodScreen extends StatelessWidget {
  PaymentMethodScreen({super.key, this.trip, required this.priceSubtext});
  final PaymentSetupController paymentSetupController =
      Get.find<PaymentSetupController>();
  final TransportData? trip;
  final RxString priceSubtext;
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
          TripDetailsTopBody(
            title: "Payment Method",
            departingFrom: trip!.from,
            arrivingTo: trip!.to,
            price: trip!.price.toString(),
            priceSubText: priceSubtext,
            date: AppHelperFunctions.formateDate(trip!.date),
          ),
          SizedBox(
            height: getHeight(16),
          ),
          Padding(
            padding: EdgeInsets.only(left: getWidth(16), right: getWidth(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Choose Payment Method",
                  fontWeight: FontWeight.w600,
                  color: Color(0xff262B2B),
                ),
                SizedBox(
                  height: getHeight(8),
                ),
                ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Obx(
                        () {
                          return Padding(
                            padding: EdgeInsets.only(bottom: getHeight(16)),
                            child: PaymentSetupCard(
                                onTap: () {
                                  paymentSetupController.selectedCard.value =
                                      index;
                                },
                                iconPath: iconPaths[index],
                                title: titles[index],
                                isCardSelected:
                                    paymentSetupController.selectedCard.value ==
                                        index),
                          );
                        },
                      );
                    }),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomAppBar(
          onTap: () {
            Get.to(PaymentSelectScreen());
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
