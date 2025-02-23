import 'dart:developer';

import 'package:courierapp/core/common/widgets/error_snakbar.dart';
import 'package:courierapp/core/common/widgets/progress_indicator.dart';
import 'package:courierapp/core/common/widgets/success_snakbar.dart';
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
      showProgressIndicator();
      final requestURL = "${AppUrls.acceptBooking}$bookingID";
      final response = await networkCaller
          .postRequest(requestURL, token: AuthService.token, body: {});
      hideProgressIndicator();
      isLoading.value = false;
      if (response.isSuccess) {
        Future.delayed(Duration(milliseconds: 200), () {
          successSnakbr(
              successMessage: "You've successfully accepted the booking.");
        });
        log("Successfully Accepted the booking");
      } else {
        Future.delayed(Duration(milliseconds: 200), () {
          errorSnakbar(errorMessage: response.errorMessage);
        });
      }
    } catch (e) {
      hideProgressIndicator();
      isLoading.value = false;
      log("Something went wrong, error: $e");
    } finally {
      hideProgressIndicator();
      isLoading.value = false;
    }
  }

  Future<void> cancelBooking(String bookingID) async {
    try {
      showProgressIndicator();
      final requestURL = "${AppUrls.cancelBooking}$bookingID";
      final response = await networkCaller
          .postRequest(requestURL, token: AuthService.token, body: {});
      hideProgressIndicator();
      if (response.isSuccess) {
        Future.delayed(Duration(milliseconds: 200), () {
          errorSnakbar(errorMessage: "Booking request cancelled.");
        });
      } else {
        Future.delayed(Duration(milliseconds: 200), () {
          errorSnakbar(errorMessage: response.errorMessage);
        });
      }
    } catch (e) {
      hideProgressIndicator();
      log("Something went wrong, error: $e");
    }
  }
}
