import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  final TextEditingController otpController = TextEditingController();

  RxInt secondsRemaining = 90.obs;
  RxBool isClickable = false.obs;
  late final Timer _timer;

  @override
  void onInit() {
    super.onInit();
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining.value > 0) {
        secondsRemaining.value--;
      } else {
        isClickable.value = true;
        _timer.cancel();
      }
    });
  }

  void resetTimer() {
    secondsRemaining.value = 80;
    isClickable.value = false;
    _startCountdown();
  }

  String formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return '$minutes:${secs.toString().padLeft(2, '0')}';
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }

  Future<void> verifyOTP(String email) async {
    // final Map<String, dynamic> requestBody = {
    //   'email': email.trim(),
    //   'otp': int.parse(otpController.text.trim()),
    // };

//     if (otpController.text.isEmpty || otpController.text.length != 6) {
//       errorSnakbar(errorMessage: "Please enter a valid 6-digit OTP");
//       return;
//     }

//     try {
//       //showProgressIndicator();
//       final response = await NetworkCaller()
//           .postRequest(AppUrls.verifyOTP, body: requestBody);
// //hideProgressIndicator();
//       log(requestBody.toString());
//       if (response.isSuccess) {
//       //  successSnakbr(successMessage: "OTP matched successfully");
//        // Get.to(() => CreateNewPasswordScreen(email: email));
//       } else {
//         errorSnakbar(
//             errorMessage: response.errorMessage.isNotEmpty
//                 ? response.errorMessage
//                 : "Failed to verify OTP");
//       }
//     } catch (e) {
//       log("Error: $e");
//       errorSnakbar(
//           errorMessage: "Something went wrong, please try again later.");
//     } finally {
//       hideProgressIndicator();
//     }
  }
}
