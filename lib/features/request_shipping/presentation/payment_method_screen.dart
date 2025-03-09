import 'dart:developer';

import 'package:courierapp/core/common/widgets/custom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_bottom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/message_notification_box.dart';
import 'package:courierapp/core/common/widgets/payment_setup_card.dart';
import 'package:courierapp/core/common/widgets/progress_indicator.dart';
import 'package:courierapp/core/common/widgets/without_payment_pop_dialog.dart';
import 'package:courierapp/core/services/Auth_service.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/icon_path.dart';
import 'package:courierapp/core/utils/helpers/app_helper.dart';
import 'package:courierapp/features/authentication/controllers/signup_controllers/payment_setup_controller.dart';
import 'package:courierapp/features/request_shipping/components/request_shiping_top_body.dart';
import 'package:courierapp/features/request_shipping/controller/request_shipping_controller.dart';
import 'package:courierapp/features/search_screen/models/all_trip_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/services/stripe_service.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key, this.trip});

  final TransportData? trip;

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  final RequestShippingController shippingController =
      Get.put(RequestShippingController());
  final PaymentSetupController paymentSetupController =
      Get.find<PaymentSetupController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 200), () {
      showDialog(
          context: context,
          builder: (context) {
            return WithoutPaymentPopDialog();
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    log("+++++++++++++++++++${widget.trip!.user.accountId}");
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: const Color(0xffFAFAFC),
        ontapBackButton: () {
          Get.back();
        },
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
            lat1: widget.trip!.lat1,
            lon1: widget.trip!.lon1,
            lat2: widget.trip!.lat2,
            lon2: widget.trip!.lon2,
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
                      iconPath: IconPath
                          .creditCardLogo, // Replace with Stripe logo if available
                      title: "Stripe",
                      isCardSelected:
                          paymentSetupController.selectedCard.value == 0,
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
          log(shippingController.price.value);
          final price =
              double.parse(shippingController.price.value.replaceAll("\$", ""));
          final customerId = AuthService.customerId;
          Future.delayed(Duration(milliseconds: 100));
          log("Payment Price: $price");
          log("Booking id : ${shippingController.bookingId.value}");
          log("Customer id : $customerId");
          log("Traveller id: ${widget.trip!.user.accountId}");
          log("Traveller Name: ${widget.trip!.user.fullName}");

          try {
            setState(() {
              StripeService.isLoading = false;
              // Reset loading state
              showProgressIndicator();
            });
            // Save payment method

            // akhan a customerId1,parcelId1,travelerAccountId1 diben
            await StripeService.instance.paymentStart(
              customerId1: customerId.toString(),
              price1: price,
              parcelId1: shippingController.bookingId.value,
              travelerAccountId1: widget.trip!.user.accountId,
              travellerName: widget.trip!.user.fullName,
            );
          } finally {
            setState(() {
              StripeService.isLoading = false;

              // Reset loading state
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
