import 'dart:developer';
import 'package:courierapp/core/services/Auth_service.dart';
import 'package:courierapp/core/services/network_caller.dart';
import 'package:courierapp/core/utils/constants/api_constants.dart';
import 'package:courierapp/features/request_shipping/presentation/payment_method_screen.dart';
import 'package:courierapp/features/search_screen/models/all_trip_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestShippingController extends GetxController {
  final NetworkCaller networkCaller = NetworkCaller();
  final TextEditingController senderMessageTEController =
      TextEditingController();
  RxInt selectedIndex = (-1).obs;
  RxString selectedItemId = "".obs;
  RxString price = "".obs;
  RxString postID = "".obs;
  RxString selectedItemWeigth = "".obs;
  void toggleSelection(
    int index,
    String itemId,
    String weight,
  ) {
    if (selectedIndex.value == index) {
      selectedIndex.value = -1;

      selectedItemId.value = "";
      selectedItemWeigth.value = "";
    } else {
      selectedIndex.value = index;
      selectedItemId.value = itemId;
      selectedItemWeigth.value = weight;
      log(selectedItemId.value.toString());
      log(selectedItemWeigth.value);
    }

    log("Selected index: ${selectedIndex.value}");
  }

  getPrice(String pricex) {
    selectedItemWeigth.value.isNotEmpty
        ? price.value =
            "\$${(int.parse(pricex.replaceAll("\$", "")) * (double.parse(selectedItemWeigth.value)))}"
        : price.value = "\$0";
  }

  Future<void> requestTransport(TransportData trip) async {
    final requestBody = {
      "postId": postID.value,
      "itemId": selectedItemId.value,
      "price": double.parse(price.value.replaceAll("\$", "")),
      "message": senderMessageTEController.text,
    };

    try {
      final response = await networkCaller.postRequest(AppUrls.requestBooking,
          body: requestBody, token: AuthService.token);

      if (response.isSuccess) {
        log("+++++++++++++++++++++++Booking successfull++++++++++++++++++++++++");
        Get.to(
          () => Get.to(
            () => PaymentMethodScreen(
              trip: trip,
            ),
          ),
        );
      }
    } catch (e) {
      log("something went wrong, error: $e");
    }
  }
}
