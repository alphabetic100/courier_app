import 'dart:developer';

import 'package:courierapp/core/common/widgets/error_snakbar.dart';
import 'package:courierapp/core/services/Auth_service.dart';
import 'package:courierapp/core/services/network_caller.dart';
import 'package:courierapp/core/utils/constants/api_constants.dart';
import 'package:courierapp/features/my_trip/models/my_bookings_model.dart';
import 'package:get/get.dart';

class MyBookingsController extends GetxController {
  final NetworkCaller networkCaller = NetworkCaller();
  Rx<MyBookingsModel?> myBookings = Rx<MyBookingsModel?>(null);

  Future<void> getMyBookings() async {
    try {
      final response = await networkCaller.getRequest(AppUrls.meAsSender,
          token: AuthService.token);
      if (response.isSuccess) {
        myBookings.value = MyBookingsModel.fromJson(response.responseData);
      } else {
        errorSnakbar(errorMessage: response.errorMessage);
      }
    } catch (e) {
      log("Something went wrong, error: $e");
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getMyBookings();
  }
}
