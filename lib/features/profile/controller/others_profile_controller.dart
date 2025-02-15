import 'dart:developer';

import 'package:courierapp/core/services/Auth_service.dart';
import 'package:courierapp/core/services/network_caller.dart';
import 'package:courierapp/core/utils/constants/api_constants.dart';
import 'package:courierapp/features/profile/data/others_profile_model.dart';
import 'package:get/get.dart';

class OthersProfileController extends GetxController {
  final NetworkCaller networkCaller = NetworkCaller();
  RxBool isLoading = false.obs;
  Rx<OthersProfileModel?> othersProfile = Rx<OthersProfileModel?>(null);

  Future<void> getOthersProfileDetails(String userId) async {
    final requestUrl = "${AppUrls.profile}/$userId";
    try {
      isLoading.value = true;
      final String? token = AuthService.token;
      if (token == null) {
        AuthService.logoutUser();
        return;
      }

      final response = await networkCaller.getRequest(requestUrl, token: token);
      if (response.isSuccess) {
        othersProfile.value =
            OthersProfileModel.fromJson(response.responseData);
      } else {
        Get.snackbar("Error", "Failed to load profile data");
      }
    } catch (e) {
      log("Error fetching profile: $e");
      Get.snackbar("Error", "Failed to load profile data");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    final String? userId = Get.parameters['userId'];
    if (userId != null) {
      getOthersProfileDetails(userId);
    }
  }
}
