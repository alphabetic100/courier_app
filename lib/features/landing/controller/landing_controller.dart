import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingController extends GetxController {
  late PageController pageController;
  RxInt currentPage = 0.obs;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
    currentPage.value = 0;
  }

  void changePage(int page) {
    if (pageController.hasClients) {
      currentPage.value = page;
      pageController.animateToPage(
        page,
        duration: Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
      );
    } else {
      log("PageController is not attached yet!");
    }
  }
}
