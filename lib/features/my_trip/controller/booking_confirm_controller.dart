import 'dart:developer';

import 'package:courierapp/core/common/widgets/error_snakbar.dart';
import 'package:courierapp/core/services/Auth_service.dart';
import 'package:courierapp/core/services/network_caller.dart';
import 'package:courierapp/core/utils/constants/api_constants.dart';
import 'package:get/get.dart';

class BookingConfirmController extends GetxController {
  final NetworkCaller networkCaller = NetworkCaller();
  RxBool isLoading = false.obs;
  Future<void> acceptBooking(String bookingID) async {
    try {
      isLoading.value = true;
      final requestURL = "${AppUrls.acceptBooking}$bookingID";
      final response = await networkCaller
          .postRequest(requestURL, token: AuthService.token, body: {});
      isLoading.value = false;
      if (response.isSuccess) {
        log("Successfully Accepted the booking");
      } else {
        errorSnakbar(errorMessage: response.errorMessage);
      }
    } catch (e) {
      isLoading.value = false;
      log("Something went wrong, error: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
