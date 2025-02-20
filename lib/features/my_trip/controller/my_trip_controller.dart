import 'dart:developer';

import 'package:courierapp/core/common/widgets/error_snakbar.dart';
import 'package:courierapp/core/common/widgets/progress_indicator.dart';
import 'package:courierapp/core/services/Auth_service.dart';
import 'package:courierapp/core/services/network_caller.dart';
import 'package:courierapp/core/utils/constants/api_constants.dart';
import 'package:courierapp/features/my_trip/models/me_as_traveller_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTripController extends GetxController with GetTickerProviderStateMixin {
  final NetworkCaller networkCaller = NetworkCaller();
  late TabController tabController;
  final PageController pageController = PageController();
  Rx<MeAsTravellerModel?> myTravels = Rx<MeAsTravellerModel?>(null);
  RxInt selectedIndex = 0.obs;
  RxString status = "request panding".obs;
  RxBool isPending = false.obs;
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      meAsTravellerPosts();
    });
    selectedIndex.value = 0;
  }

  Future<void> meAsTravellerPosts() async {
    try {
      showProgressIndicator();
      final response = await networkCaller.getRequest(AppUrls.meAsTraveller,
          token: AuthService.token);
      hideProgressIndicator();
      if (response.isSuccess) {
        myTravels.value = MeAsTravellerModel.fromJson(response.responseData);

        log(myTravels.value.toString());
      } else {
        errorSnakbar(errorMessage: response.errorMessage);
      }
    } catch (e) {
      log("Something went wrong, error: $e");
    }
  }

  Future<void> refreshTravellPosts() async {
    try {
      final response = await networkCaller.getRequest(AppUrls.meAsTraveller,
          token: AuthService.token);

      if (response.isSuccess) {
        myTravels.value = MeAsTravellerModel.fromJson(response.responseData);

        log(myTravels.value.toString());
      } else {
        errorSnakbar(errorMessage: response.errorMessage);
      }
    } catch (e) {
      log("Something went wrong, error: $e");
    }
  }

  @override
  void onClose() {
    tabController.dispose();
    pageController.dispose(); 
    super.onClose();
  }
}
