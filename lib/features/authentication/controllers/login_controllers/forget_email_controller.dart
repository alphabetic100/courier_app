import 'package:courierapp/core/services/network_caller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../core/common/widgets/error_snakbar.dart';
import '../../../../core/common/widgets/progress_indicator.dart';
import '../../../../core/common/widgets/success_snakbar.dart';
import '../../../../core/utils/constants/api_constants.dart';

class ForgetEmailController extends GetxController {
  final TextEditingController forgotEmailTEController = TextEditingController();
  final GlobalKey<FormState> forgetEmailFormKey = GlobalKey<FormState>();
  var isEmailSent = false.obs;


  Future<bool> forgetEmail() async {
    Map<String, String> requestBody = {
      "email": forgotEmailTEController.text.trim(),
    };

    try {
      showProgressIndicator();

      final response = await NetworkCaller().postRequest(AppUrls.forgetEmail,
          body: requestBody);

      hideProgressIndicator();

      if (response.isSuccess) {
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





  @override
  void onClose() {
    forgotEmailTEController.dispose();
    super.onClose();
  }
}