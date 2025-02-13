import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestShippingController extends GetxController {
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
}
