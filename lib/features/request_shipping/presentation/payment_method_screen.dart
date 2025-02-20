import 'package:courierapp/core/common/widgets/custom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_bottom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/message_notification_box.dart';
import 'package:courierapp/core/common/widgets/payment_setup_card.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/icon_path.dart';
import 'package:courierapp/core/utils/helpers/app_helper.dart';
import 'package:courierapp/features/authentication/controllers/signup_controllers/payment_setup_controller.dart';
import 'package:courierapp/features/request_shipping/components/request_shiping_top_body.dart';
import 'package:courierapp/features/request_shipping/presentation/payment_select_screen.dart';
import 'package:courierapp/features/search_screen/models/all_trip_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/services/stripe_service.dart';

class PaymentMethodScreen extends StatefulWidget {
  PaymentMethodScreen({super.key, this.trip});

  final TransportData? trip;

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  final PaymentSetupController paymentSetupController =
  Get.find<PaymentSetupController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: const Color(0xffFAFAFC),
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
          RequestShippingTopBody(
            title: "Payment Method",
            departingFrom: widget.trip!.from,
            arrivingTo: widget.trip!.to,
            price: widget.trip!.price.toString(),
            date: AppHelperFunctions.formateDate(widget.trip!.date),
          ),
          SizedBox(height: getHeight(16)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Chose Payment Method",
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff262B2B),
                ),
                SizedBox(height: getHeight(8)),
                Obx(
                      () => Padding(
                    padding: EdgeInsets.only(bottom: getHeight(16)),
                    child: PaymentSetupCard(
                      onTap: () {
                        paymentSetupController.selectedCard.value = 0;
                      },
                      iconPath: IconPath.creditCardLogo, // Replace with Stripe logo if available
                      title: "Stripe",
                      isCardSelected: paymentSetupController.selectedCard.value == 0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomAppBar(
        onTap: () async {
          try {
            setState(() {
              StripeService.isLoading = false; // Reset loading state
            });
            // Save payment method

            // akhan a customerId1,parcelId1,travelerAccountId1 diben
            await StripeService.instance.paymentStart(
                customerId1: "", price1: 1, parcelId1: '', travelerAccountId1: '',);



          } finally {
            setState(() {
              StripeService.isLoading = false; // Reset loading state
            });
          }
          //Get.to(PaymentSelectScreen());
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
        isPrimaryButton: true,
      ),
    );
  }
}
