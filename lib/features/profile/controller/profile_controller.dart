import 'dart:developer';
import 'package:get/get.dart';
import '../../../core/common/widgets/error_snakbar.dart';
import '../../../core/services/Auth_service.dart';
import '../../../core/services/network_caller.dart';
import '../../../core/utils/constants/api_constants.dart';
import '../data/profile_model.dart';

class ProfileController extends GetxController {
  final NetworkCaller networkCaller = NetworkCaller();
  RxBool isLoading = false.obs;
  ProfileModel? profile;

  Future<void> getProfileDetails() async {
    try {

      isLoading.value = true;
      log(AuthService.token.toString());
      final String token = AuthService.token!;

      final response =
      await networkCaller.getRequest(AppUrls.getProfile, token: token);


      if (response.isSuccess) {
        profile = ProfileModel.fromJson(response.responseData);

      } else {
        errorSnakbar(errorMessage: "Failed to load profile data");
      }
    } catch (e) {
      log("Error fetching profile: $e");
      errorSnakbar(errorMessage: "Something went wrong");
    } finally {

      isLoading.value = false;
    }
  }

  Future<void> logOut() async {
    AuthService.logoutUser();

  }

  @override
  void onReady() {
    getProfileDetails();
    super.onReady();


  }
}
