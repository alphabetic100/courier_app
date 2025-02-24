import 'dart:developer';

import 'package:courierapp/core/services/network_caller.dart';
import 'package:courierapp/core/utils/constants/api_constants.dart';
import 'package:get/get.dart';

class SocialLoginController extends GetxController {
  final NetworkCaller networkCaller = NetworkCaller();
  Future<void> socialLogin(String email) async {
    final requestBody = {
      "email": email,
    };

    final response = await networkCaller.postRequest(AppUrls.socalMedaiLogin,
        body: requestBody);
    if (response.isSuccess) {
      log("++++++++++++++++++++${response.responseData}");
    }
  }
}
