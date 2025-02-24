import 'dart:developer';

import 'package:courierapp/core/common/widgets/error_snakbar.dart';
import 'package:courierapp/core/services/Auth_service.dart';
import 'package:courierapp/core/services/network_caller.dart';
import 'package:courierapp/core/utils/constants/api_constants.dart';
import 'package:courierapp/features/authentication/data/models/social_login_model.dart';
import 'package:courierapp/features/authentication/data/models/social_signup_model.dart';
import 'package:courierapp/features/landing/presentation/screens/landing_screen.dart';
import 'package:get/get.dart';

class SocialLoginController extends GetxController {
  final NetworkCaller networkCaller = NetworkCaller();
  Future<void> socialLogin(String email) async {
    try {
      final requestBody = {
        "email": email,
      };

      final response = await networkCaller.postRequest(AppUrls.socalMedaiLogin,
          body: requestBody);
      if (response.isSuccess) {
        final user = SocialLoginModel.fromJson(response.responseData);
        log(user.data.accessToken);
        AuthService.saveToken(user.data.accessToken, user.data.role);
        Future.delayed(Duration(milliseconds: 200), () {
          Get.offAll(() => LandingScreen());
        });
        // log("customer id : ${user.data.customerId}");
        // AuthService.saveCustomerId(customerID: user.data.customerId);
      } else {
        errorSnakbar(errorMessage: response.errorMessage);
      }
    } catch (e) {
      log("Something went wrong, errror: $e");
    }
  }

  Future<void> socialSignup(String email) async {
    try {
      final requestBody = {
        "email": email,
      };

      final response = await networkCaller.postRequest(AppUrls.socalMedaiLogin,
          body: requestBody);
      if (response.isSuccess) {
        final user = SocialSignupModel.fromJson(response.responseData);
        log(user.data.accessToken);
        log(user.data.accountLink);
        log("customer id : ${user.data.customerId}");
        AuthService.saveCustomerId(customerID: user.data.customerId);
      } else {
        errorSnakbar(errorMessage: response.errorMessage);
      }
    } catch (e) {
      log("Something went wrong, error: $e");
    }
  }
}
