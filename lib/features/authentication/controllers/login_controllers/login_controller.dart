import 'dart:developer'; // Make sure this is imported

import 'package:courierapp/core/common/widgets/error_snakbar.dart';
import 'package:courierapp/core/common/widgets/success_snakbar.dart';
import 'package:courierapp/core/services/Auth_service.dart';
import 'package:courierapp/core/utils/constants/api_constants.dart';
import 'package:courierapp/routes/app_routes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/common/widgets/progress_indicator.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RxBool rememberMe = false.obs;
  @override
  void onInit() {
    super.onInit();

    loadSavedCredentials();
  }

  void toggleRememberMe() {
    rememberMe.value = !rememberMe.value;
    log(rememberMe.value.toString());
  }

  // Non-static loadSavedCredentials method
  Future<void> loadSavedCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool? checkRemember = prefs.getBool("rememberMe");
    log("checkRemember: $checkRemember");
    if (checkRemember == true) {
      // Only autofill if "Remember Me" is enabled
      String? email = prefs.getString('email');
      String? password = prefs.getString('password');
      emailController.text = email ?? '';
      passwordController.text = password ?? '';
      log('Loaded Email: $email');
      log('Loaded Password: $password');
    } else {
      // If "Remember Me" is not enabled, ensure the fields are empty
      emailController.clear();
      passwordController.clear();
    }
  }

  Future<void> login() async {
    final Dio dio = Dio();
    dio.options = BaseOptions(
      connectTimeout: Duration(seconds: 10),
      validateStatus: (status) {
        return status! < 500;
      },
    );
    final Map<String, dynamic> requestBody = {
      "email": emailController.text.trim(),
      "password": passwordController.text.trim(),
      "fcmToken": "example_fcm_token"
    };

    try {
      showProgressIndicator();
      log(requestBody.toString());

      final response = await dio.post(
        AppUrls.login,
        data: requestBody,
      );
      log(response.statusCode.toString());
      log(response.toString());

      if (response.statusCode == 200) {
        if (rememberMe.value) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setBool('rememberMe', true);
          await prefs.setString('email', emailController.text.trim());
          await prefs.setString('password', passwordController.text.trim());
          log("Saved credentials");
          log("Saved rememberMe: ${prefs.getBool('rememberMe')}");
          log("Saved email: ${prefs.getString('email')}");
          log("Saved password: ${prefs.getString('password')}");
        } else {
          // Clear the saved credentials if "Remember Me" is not checked
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.remove('rememberMe');
          await prefs.remove('email');
          await prefs.remove('password');
        }

        final responseBody = response.data;
        final userName = responseBody["data"]["fullName"];
        successSnakbr(
            successMessage: "Logged in Successfully! Welcome back, $userName");
        Get.offAllNamed(AppRoute.landingScreen);

        AuthService.saveToken(
            responseBody["data"]["accessToken"], responseBody["data"]["role"]);
        await AuthService.saveId(id: responseBody['data']['id']);
        log("AccessToken: ${responseBody['data']["accessToken"]}");
        log("UserId: ${responseBody['data']["id"]}");

        hideProgressIndicator();
      } else if (response.statusCode == 400) {
        hideProgressIndicator();
        Future.delayed(Duration(milliseconds: 200), () {
          errorSnakbar(errorMessage: "Password incorrect");
        });
      } else {
        hideProgressIndicator();
        final errorMessage = response.data["message"];
        Future.delayed(Duration(milliseconds: 200), () {
          errorSnakbar(
              errorMessage:
                  errorMessage ?? "Something went wrong please try again");
        });
      }
    } on DioException catch (e) {
      hideProgressIndicator();
      log("Something went wrong, error: $e");
      Future.delayed(Duration(milliseconds: 200), () {
        errorSnakbar(
            errorMessage:
                "Please check your internet connection and try again");
      });
    } finally {
      hideProgressIndicator();
    }
  }
}
