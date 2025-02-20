import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/common/widgets/error_snakbar.dart';
import '../../../core/common/widgets/progress_indicator.dart';
import '../../../core/common/widgets/success_snakbar.dart';
import '../../../core/services/network_caller.dart';
import '../../../core/utils/constants/api_constants.dart';
import '../presentation/screens/change_password_otp_screen.dart';
import '../presentation/screens/change_password_screen.dart';

class ForgotEmailAndOtpController extends GetxController{
  var isEmailSent = false.obs;

  final otpController = TextEditingController();



  Future<bool> forgetEmail(String email) async {
    Map<String, String> requestBody = {
      "email": email,
    };

    try {
      showProgressIndicator();

      final response = await NetworkCaller().postRequest(AppUrls.forgetEmail,
          body: requestBody);

      hideProgressIndicator();

      if (response.isSuccess) {
        Get.to(() => ChangePasswordOtpScreen(email: email,));
        successSnakbr(successMessage: "OTP Sent Successfully");

        isEmailSent.value = true;
        return isEmailSent.value;
      } else {
        errorSnakbar(errorMessage: response.errorMessage);
      }
    } catch (e) {
      hideProgressIndicator();
      errorSnakbar(errorMessage: "Something went wrong, error: $e");
      throw Exception("Error: $e");
    }
    return isEmailSent.value;
  }

  Future<void> verifyOTP(String email) async {
    final Map<String, dynamic> requestBody = {
      'email': email.trim(),
      'otp': int.parse(otpController.text.trim()),
    };

    if (otpController.text.isEmpty || otpController.text.length != 6) {
      errorSnakbar(errorMessage: "Please enter a valid 6-digit OTP");
      return;
    }

    try {
      showProgressIndicator();
      final response = await NetworkCaller()
          .postRequest(AppUrls.verifyOTP, body: requestBody);
      hideProgressIndicator();
      log(requestBody.toString());
      if (response.isSuccess) {

        Get.to(() => ChangePasswordScreen(
          email: email,
        ));
        successSnakbr(successMessage: "OTP matched successfully");
      } else {
        errorSnakbar(
            errorMessage: response.errorMessage.isNotEmpty
                ? response.errorMessage
                : "Failed to verify OTP");
      }
    } catch (e) {
      log("Error: $e");
      errorSnakbar(
          errorMessage: "Something went wrong, please try again later.");
    } finally {
      hideProgressIndicator();
    }
  }
}