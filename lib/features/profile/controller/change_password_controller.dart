import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/common/widgets/error_snakbar.dart';
import '../../../core/common/widgets/progress_indicator.dart';
import '../../../core/common/widgets/success_snakbar.dart';
import '../../../core/services/Auth_service.dart';
import '../../../core/utils/constants/api_constants.dart';

class ChangePasswordController extends GetxController{
  final TextEditingController newPasswordTEController = TextEditingController();
  final TextEditingController confirmPasswordTEController = TextEditingController();



  Future<void> changePassword() async {
    final Dio dio = Dio();
    dio.options = BaseOptions(

        validateStatus: (status) {
          return status! < 500;
        },
        headers: {
          "Authorization": "${AuthService.token}",  // Include the token here
        }
    );

    final Map<String, dynamic> requestBody = {
      "password": newPasswordTEController.text
    };

    try {
      showProgressIndicator();
      log(requestBody.toString());

      final response = await dio.put(
        AppUrls.updatePassword,
        data: requestBody,
      );
      log(response.statusCode.toString());
      log(response.data.toString());

      if (response.statusCode == 200 || response.statusCode == 201) {
        newPasswordTEController.clear();
        confirmPasswordTEController.clear();
        hideProgressIndicator();
        // Successful response

        successSnakbr(successMessage: "Password Updated Successfully!");

        //Get.offAllNamed(AppRoute.landingScreen);


      } else if (response.statusCode == 400) {
        hideProgressIndicator();
        errorSnakbar(errorMessage: "Password incorrect");
      } else {
        hideProgressIndicator();
        final errorMessage = response.data["message"] ?? "Something went wrong please try again";
        errorSnakbar(errorMessage: errorMessage);
      }
    } on DioException catch (e) {
      hideProgressIndicator();
      log("something went wrong, error: $e");
      errorSnakbar(
          errorMessage: "Please check your internet connection and try again");
    }
  }

}