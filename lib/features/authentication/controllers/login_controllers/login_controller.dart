import 'dart:developer';

import 'package:courierapp/core/common/widgets/error_snakbar.dart';
import 'package:courierapp/core/common/widgets/success_snakbar.dart';
import 'package:courierapp/core/services/Auth_service.dart';
import 'package:courierapp/core/utils/constants/api_constants.dart';
import 'package:courierapp/routes/app_routes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passworadController = TextEditingController();
  RxBool rememberMe = false.obs;

  void toggleRememberMe() {
    rememberMe.value = !rememberMe.value;
  }

  Future<void> login() async {
    final Dio dio = Dio();
    dio.options = BaseOptions(
      connectTimeout: Duration(seconds: 10),
      validateStatus: (status) {
        return status! < 500;
      },
    );
    final Map<String, dynamic> requestbody = {
      "email": emailController.text.trim(),
      "password": passworadController.text.trim(),
      "fcmToken": "example_fcm_token"
    };

    try {
      log(requestbody.toString());

      final response = await dio.post(
        AppUrls.login,
        data: requestbody,
      );
      log(response.statusCode.toString());
      log(response.toString());

      if (response.statusCode == 200) {
        // Successful response
        final responseBody = response.data;
        final userName = responseBody["data"]["fullName"];

        successSnakbr(
          successMessage: "Logged in Successfully! Welcome back, $userName",
        );

        Get.toNamed(AppRoute.landingScreen);
        AuthService.saveToken(
            responseBody["data"]["accessToken"], responseBody["data"]["role"]);
        log(responseBody['data']["accessToken"]);
      } else if (response.statusCode == 400) {
        errorSnakbar(errorMessage: "Password incorrect");
      } else {
        final errorMessage = response.data["message"];
        errorSnakbar(
            errorMessage:
                errorMessage ?? "Something went wrong please try again");
      }
    } on DioException catch (e) {
      log("something went wrong, error: $e");
      errorSnakbar(
          errorMessage: "Please check your internet connection and try again");
    }
  }
}
