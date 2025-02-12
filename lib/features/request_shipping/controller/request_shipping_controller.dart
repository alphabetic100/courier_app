import 'dart:developer';

import 'package:get/get.dart';

class RequestShippingController extends GetxController {
  RxList<int> selectedItems = <int>[].obs;

  void toggleSelection(int index) {
    if (selectedItems.contains(index)) {
      selectedItems.remove(index);
    } else {
      selectedItems.add(index);
    }

    log(selectedItems.toString());
  }
}
