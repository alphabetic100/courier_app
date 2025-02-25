import 'dart:developer';

import 'package:courierapp/core/common/widgets/error_snakbar.dart';
import 'package:courierapp/core/services/Auth_service.dart';
import 'package:courierapp/core/services/network_caller.dart';
import 'package:courierapp/core/utils/constants/api_constants.dart';
import 'package:courierapp/features/my_trip/models/booking_request_model.dart';
import 'package:courierapp/features/my_trip/models/me_as_traveller_model.dart';
import 'package:courierapp/features/my_trip/models/single_travel_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTripController extends GetxController with GetTickerProviderStateMixin {
  final NetworkCaller networkCaller = NetworkCaller();
  late TabController tabController;
  final PageController pageController = PageController();
  Rx<MeAsTravellerModel?> myTravels = Rx<MeAsTravellerModel?>(null);
  Rx<SingleTravelModel?> singleTravel = Rx<SingleTravelModel?>(null);
  Rx<BookingRequestModel?> bookingRequest = Rx<BookingRequestModel?>(null);
  RxInt selectedIndex = 0.obs;
  RxString status = "request panding".obs;
  RxBool isPending = false.obs;
  RxBool isLoading = false.obs;
  RxBool isTravelLoading = false.obs;
  RxBool isbookingLoading = false.obs;
  RxInt totalPendingRequest = 0.obs;
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    Future.delayed(Duration(milliseconds: 200), () {
      meAsTravellerPosts();
    });
    selectedIndex.value = 0;
  }

  Future<void> meAsTravellerPosts() async {
    try {
      isLoading.value = true;
      final response = await networkCaller.getRequest(AppUrls.meAsTraveller,
          token: AuthService.token);
      isLoading.value = false;
      if (response.isSuccess) {
        myTravels.value = MeAsTravellerModel.fromJson(response.responseData);

        log(myTravels.value.toString());

        log(myTravels.value!.data.totalPendingCount.toString());
        totalPendingRequest.value = myTravels.value!.data.totalPendingCount;
        log("Total pending count is : $totalPendingRequest");
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

  Future<void> getSingleTravelPost(String postID) async {
    try {
      isTravelLoading.value = true;
      final String requestUrl = "${AppUrls.getMySingleTravelPost}/$postID";
      final response =
          await networkCaller.getRequest(requestUrl, token: AuthService.token);
      isTravelLoading.value = false;
      if (response.isSuccess) {
        singleTravel.value = SingleTravelModel.fromJson(response.responseData);
      } else {
        errorSnakbar(errorMessage: response.errorMessage);
      }
    } catch (e) {
      isTravelLoading.value = false;
      log("Something went wrong, error: $e");
    } finally {
      isTravelLoading.value = false;
    }
  }

  Future<void> refreshSingleTravelPost(String postID) async {
    try {
      final String requestUrl = "${AppUrls.getMySingleTravelPost}/$postID";
      final response =
          await networkCaller.getRequest(requestUrl, token: AuthService.token);

      if (response.isSuccess) {
        singleTravel.value = SingleTravelModel.fromJson(response.responseData);
      } else {
        errorSnakbar(errorMessage: response.errorMessage);
      }
    } catch (e) {
      log("Something went wrong, error: $e");
    }
  }

  Future<void> getMyBookingAsTraveller(String bookingID) async {
    try {
      isbookingLoading.value = true;
      final requestUrl = "${AppUrls.myBookingAsTraveller}$bookingID";
      final response =
          await networkCaller.getRequest(requestUrl, token: AuthService.token);
      isbookingLoading.value = false;
      if (response.isSuccess) {
        bookingRequest.value =
            BookingRequestModel.fromJson(response.responseData);
      } else {
        errorSnakbar(errorMessage: response.errorMessage);
      }
    } catch (e) {
      isbookingLoading.value = false;
      log("Something went wrong, error: $e");
    } finally {
      isbookingLoading.value = false;
    }
  }

  @override
  void onClose() {
    tabController.dispose();
    pageController.dispose();
    super.onClose();
  }
}
