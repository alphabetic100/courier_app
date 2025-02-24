import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:courierapp/core/common/widgets/error_snakbar.dart';
import 'package:courierapp/core/common/widgets/progress_indicator.dart';
import 'package:courierapp/core/common/widgets/success_snakbar.dart';
import 'package:courierapp/core/services/Auth_service.dart';
import 'package:courierapp/core/services/network_caller.dart';
import 'package:courierapp/core/utils/constants/api_constants.dart';
import 'package:courierapp/features/authentication/data/models/social_login_model.dart';
import 'package:courierapp/features/landing/presentation/screens/landing_screen.dart';
import 'package:courierapp/features/profile/controller/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SocialLoginController extends GetxController {
  final NetworkCaller networkCaller = NetworkCaller();
  final EditProfileController editProfileController = EditProfileController();
  Future<void> socialLogin(
      String email, String userName, String phone, String profileImage) async {
    try {
      showProgressIndicator();
      final requestBody = {
        "email": email,
      };

      final response = await networkCaller.postRequest(AppUrls.socalMedaiLogin,
          body: requestBody);

      hideProgressIndicator();
      if (response.isSuccess) {
        final user = SocialLoginModel.fromJson(response.responseData);
        log(user.data.accessToken);
        AuthService.saveToken(user.data.accessToken, user.data.role);
        Future.delayed(Duration(milliseconds: 200), () {
          successSnakbr(
              successMessage:
                  "Logged in Successfully! Welcome back, $userName");
          updatesocialProfile(
              fullName: userName, phone: phone, imageUrl: profileImage);
          Get.offAll(() => LandingScreen());
        });
        log("customer id : ${user.data.customerId}");
        AuthService.saveCustomerId(customerID: user.data.customerId);
      } else {
        errorSnakbar(errorMessage: response.errorMessage);
      }
    } catch (e) {
      log("Something went wrong, errror: $e");
    }
  }

  // update after social login
  Future<void> updatesocialProfile({
    required String fullName,
    required String phone,
    required String imageUrl, // Image URL as a parameter
  }) async {
    final Map<String, String> requestBody = {
      "fullName": fullName,
      "phoneNumber": phone,
    };

    if (AuthService.token == null || AuthService.token!.isEmpty) {
      Get.snackbar('Error', 'Token is invalid or expired.',
          backgroundColor: Colors.redAccent, colorText: Colors.white);
      return;
    }

    try {
      var request =
          http.MultipartRequest('PUT', Uri.parse(AppUrls.updateProfile));
      request.headers.addAll({'Authorization': AuthService.token!});
      request.fields['bodyData'] = jsonEncode(requestBody);

      if (imageUrl.isNotEmpty) {
        request.fields['profileImageUrl'] = imageUrl;
      }

      var response = await request.send();

      if (response.statusCode == 200 || response.statusCode == 201) {
        log('Profile updated successfully.');
      } else {
        var errorResponse = await response.stream.bytesToString();
        log('Response error: $errorResponse');
      }
    } catch (e) {
      log('Request error: $e');
    }
  }
}
