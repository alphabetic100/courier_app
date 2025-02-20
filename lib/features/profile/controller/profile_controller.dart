import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/common/widgets/error_snakbar.dart';
import '../../../core/services/Auth_service.dart';
import '../../../core/services/network_caller.dart';
import '../../../core/utils/constants/api_constants.dart';
import '../data/profile_model.dart';

class ProfileController extends GetxController {
  final NetworkCaller networkCaller = NetworkCaller();
  RxBool isLoading = false.obs;
  Rx<ProfileModel?> profile = Rx<ProfileModel?>(null);

  Future<void> getProfileDetails() async {
    try {
      isLoading.value = true;
      log(AuthService.token.toString());
      final String? token = AuthService.token;
      final response =
          await networkCaller.getRequest(AppUrls.getProfile, token: token);
      isLoading.value = false;
      if (response.isSuccess) {
        profile.value = ProfileModel.fromJson(response.responseData);

        //Save customer id
        if (profile.value != null) {
          AuthService.saveCustomerId(
              customerID: profile.value!.data.customerId);
        }
        final customerId = AuthService.customerId;
        log("customer id is : $customerId");
      } else {
        errorSnakbar(errorMessage: "Failed to load profile data");
      }
    } catch (e) {
      log("Error fetching profile: $e");
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.snackbar("Error", "Failed to load profile data");
      });
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logOut() async {
    AuthService.logoutUser();
  }

  @override
  void onReady() {
    getProfileDetails();
    super.onReady();
  }

  // @override
  // void onInit() {
  //   // TODO: implement onInit
  //   super.onInit();
  //   getProfileDetails();
  // }
}
