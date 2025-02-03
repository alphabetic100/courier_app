import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTripController extends GetxController with GetTickerProviderStateMixin {
  late TabController tabController;
  final PageController pageController = PageController();
  RxInt selectedIndex = 0.obs;
  RxString status = "request panding".obs;
  RxBool isPending = false.obs;
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
