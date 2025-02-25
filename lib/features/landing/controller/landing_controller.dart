import 'dart:developer';

import 'package:courierapp/core/services/Auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingController extends GetxController {
  final PageController pageController = PageController();

  RxInt currentPage = 0.obs;
  RxInt notifications = 1.obs;

  changePage(int page) {
    currentPage.value = page;
    pageController.animateToPage(
      page,
      duration: Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }


  @override
  void onInit() {
    super.onInit();
    log("++++++++++++++++++${AuthService.token}");
    currentPage.value = 0;
  }

  @override
  void onClose() {
    super.onClose();
    pageController.dispose();
  }
}
