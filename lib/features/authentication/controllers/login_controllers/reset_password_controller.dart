import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


import '../../../../core/common/widgets/error_snakbar.dart';
import '../../../../core/common/widgets/progress_indicator.dart';
import '../../../../core/common/widgets/success_snakbar.dart';
import '../../../../core/services/network_caller.dart';
import '../../../../core/utils/constants/api_constants.dart';
import '../../../../routes/app_routes.dart';

class NewPasswordController extends GetxController {
  // Network caller
  final NetworkCaller networkCaller = NetworkCaller();

  final passwordTEController = TextEditingController();
  final confirmPasswordTEController = TextEditingController();

  Future<void> createNewPassword(String email) async {
    late String newPassword;

    if (passwordTEController.text == confirmPasswordTEController.text) {
      newPassword = passwordTEController.text.trim();
    } else {
      errorSnakbar(errorMessage: "Passwords do not match");
      return;
    }

    Map<String, String> requestBody = {
      "email": email,
      "newPassword": newPassword,
    };

    try {
      showProgressIndicator();
      final response = await networkCaller.postRequest(AppUrls.newPassword,
          body: requestBody);
      hideProgressIndicator();
      if (response.isSuccess) {
        successSnakbr(successMessage: "Password changed successfully");
        Get.offAllNamed(AppRoute.loginScreen);
      } else {
        errorSnakbar(
            errorMessage: response.errorMessage.isNotEmpty
                ? response.errorMessage
                : "Failed to change password");
      }
    } catch (e) {
      errorSnakbar(errorMessage: "Something went wrong: $e");
    } finally {
      hideProgressIndicator();
    }
  }
}
