import 'package:get/get.dart';

import '../../../core/common/widgets/error_snakbar.dart';
import '../../../core/common/widgets/progress_indicator.dart';
import '../../../core/common/widgets/success_snakbar.dart';
import '../../../core/services/network_caller.dart';
import '../../../core/utils/constants/api_constants.dart';

class ForgotEmailAndOtpController extends GetxController{
  var isEmailSent = false.obs;



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
}