import 'dart:developer';
import 'package:courierapp/core/common/widgets/error_snakbar.dart';
import 'package:courierapp/core/services/network_caller.dart';
import 'package:courierapp/core/utils/constants/api_constants.dart';
import 'package:courierapp/features/my_trip/models/delivery_details_model.dart';
import 'package:get/get.dart';

class DeliveryDetailsController extends GetxController {
  final NetworkCaller networkCaller = NetworkCaller();
  Rx<DeliveryDetailsModel?> deliveryDetails = Rx<DeliveryDetailsModel?>(null);

  Future<void> getDeliveryDetails(String bookingID, String? token) async {
    final String requestURL = "${AppUrls.mySingleBooking}$bookingID";
    try {
      log(token.toString());
      final response = await networkCaller.getRequest(requestURL, token: token);
      if (response.isSuccess) {
        deliveryDetails.value =
            DeliveryDetailsModel.fromJson(response.responseData);
      } else {
        errorSnakbar(errorMessage: response.errorMessage);
        log("Failed to fetch details: ${response.errorMessage}");
      }
    } catch (e) {
      log("Something went wrong, error: $e");
    }
  }
}
