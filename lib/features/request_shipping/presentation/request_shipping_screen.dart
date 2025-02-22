import 'dart:developer';

import 'package:courierapp/core/common/widgets/custom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_bottom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/custom_text_form_field.dart';
import 'package:courierapp/core/common/widgets/error_snakbar.dart';
import 'package:courierapp/core/common/widgets/item_card_two.dart';
import 'package:courierapp/core/common/widgets/message_notification_box.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/helpers/app_helper.dart';
import 'package:courierapp/features/request_shipping/components/request_shiping_top_body.dart';
import 'package:courierapp/features/request_shipping/controller/request_shipping_controller.dart';
import 'package:courierapp/features/request_shipping/presentation/payment_select_screen.dart';
import 'package:courierapp/features/search_screen/controller/item_controller.dart';
import 'package:courierapp/features/search_screen/models/all_trip_model.dart';
import 'package:courierapp/features/search_screen/presentation/screens/add_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestShippingScreen extends StatelessWidget {
  RequestShippingScreen({super.key, required this.trip});
  final RequestShippingController requestShippingController =
      Get.put(RequestShippingController());
  final ItemController itemController = Get.put(ItemController());
  final TransportData trip;
  final GlobalKey<FormState> validator = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    requestShippingController.getPrice(trip.price.toString());
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: Color(0xffFAFAFC),
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: getWidth(16),
            ),
            child: MessageNotificationBox(),
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Form(
        key: validator,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RequestShippingTopBody(
              title: "Request shipping",
              departingFrom: trip.from,
              arrivingTo: trip.to,
              price: trip.price.toString(),
              date: AppHelperFunctions.formateDate(trip.date),
              lat1: trip.lat1,
              lon1: trip.lon1,
              lat2: trip.lat2,
              lon2: trip.lon2,
            ),
            VerticalSpace(height: getHeight(20)),
            Obx(
              () => ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: itemController.myItems.value!.data.length,
                itemBuilder: (context, index) {
                  final item = itemController.myItems.value!.data[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: getHeight(20)),
                    child: GestureDetector(
                      onTap: () {
                        requestShippingController.toggleSelection(
                          index,
                          item.id,
                          double.parse(item.weight.toString())
                              .toStringAsFixed(1)
                              .toString(),
                        );
                        requestShippingController
                            .getPrice(trip.price.toString());
                      },
                      child: Obx(
                        () => Padding(
                          padding: EdgeInsets.only(
                              left: getWidth(16), right: getWidth(16)),
                          child: ItemCardTwo(
                            isdeletable:
                                requestShippingController.selectedIndex.value !=
                                    index,
                            item: item,
                            isSelected:
                                requestShippingController.selectedIndex.value ==
                                    index,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: getWidth(16), right: getWidth(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomButton(
                      height: getHeight(60),
                      isPrimary: false,
                      onPressed: () {
                        Get.to(() => AddItem());
                      },
                      child: CustomText(
                        fontWeight: FontWeight.w600,
                        text: "Add a Item",
                      )),
                  VerticalSpace(height: getHeight(10)),
                  CustomText(
                    text: "Message",
                    fontSize: getWidth(16),
                    fontWeight: FontWeight.w600,
                    color: Color(0xff262B2B),
                  ),
                  SizedBox(
                    height: getHeight(8),
                  ),
                  CustomTexFormField(
                    controller:
                        requestShippingController.senderMessageTEController,
                    hintText: "Message for your traveller ",
                    maxLines: 4,
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return "Message is required";
                      } else if (p0.length < 10) {
                        return "Message should be at least 10 characters long";
                      }
                      return null;
                    },
                  )
                ],
              ),
            )
          ],
        ),
      )),
      bottomNavigationBar: CustomBottomAppBar(
        onTap: () {
          Get.to(() => PaymentSelectScreen());
        },
        secondaryWidget: Row(
          children: [
            Icon(
              CupertinoIcons.cube_box,
              color: AppColors.secondaryColor,
            ),
            HorizontalSpace(width: getWidth(10)),
            Expanded(
              child: CustomText(
                text:
                    "Your shipment will be confirmed once the traveller accepts the request.",
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        isPrimaryButton: false,
        primaryWidget: Row(
          children: [
            Expanded(
              child: CustomButton(
                  isPrimary: true,
                  onPressed: () {
                    if (requestShippingController.selectedIndex.value < 0) {
                      errorSnakbar(errorMessage: "Please select your item");
                      return;
                    } else if (validator.currentState!.validate()) {
                      requestShippingController.postID.value = trip.id;
                      log(requestShippingController.postID.value);
                      log(requestShippingController.selectedItemId.value);
                      log(requestShippingController.price.value);
                      requestShippingController.requestTransport(trip);
                    }
                  },
                  child: CustomText(
                    text: "Pay",
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
