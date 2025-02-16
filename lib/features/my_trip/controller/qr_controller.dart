import 'dart:convert';
import 'dart:developer';

import 'package:courierapp/core/common/widgets/error_snakbar.dart';
import 'package:courierapp/core/services/Auth_service.dart';
import 'package:courierapp/core/services/network_caller.dart';
import 'package:courierapp/core/utils/constants/api_constants.dart';
import 'package:get/get.dart';

class QrController extends GetxController {
  final NetworkCaller networkCaller = NetworkCaller();
  var qrData = "https://www.example.com".obs;

  var scannedData = "No data scanned yet".obs;

  void updateScannedData(String data) {
    scannedData.value = data;
  }

  Future<void> generateQRforPicUp(String bookingID) async {
    try {
      final Map<String, String> requestBody = {
        "id": bookingID,
        "status": "pickupped"
      };
      final response = await networkCaller.postRequest(AppUrls.generateHexCode,
          token: AuthService.token, body: requestBody);
      if (response.isSuccess) {
        log("++++++++++++++++");

        qrData.value = jsonDecode(response.responseData)["data"];
      } else {
        errorSnakbar(errorMessage: response.errorMessage);
      }
    } catch (e) {
      log("Something went wrong, error: $e");
    }
  }

  Future<void> generateQRforDeliverd(String bookingID) async {
    try {
      final Map<String, String> requestBody = {
        "id": bookingID,
        "status": "delivered"
      };
      final response = await networkCaller.postRequest(
          AppUrls.generateCodeDeliverd,
          token: AuthService.token,
          body: requestBody);
      if (response.isSuccess) {
        qrData.value = jsonDecode(response.responseData)["data"];
      } else {
        errorSnakbar(errorMessage: response.errorMessage);
      }
    } catch (e) {
      log("Something went wrong, error: $e");
    }
  }

  //Traveller part

  Future<void> verifyPicupCode(String token) async {
    try {
      final Map<String, String> requestBody = {
        "token": token,
      };

      final response = await networkCaller.postRequest(AppUrls.verifyPicupCode,
          token: AuthService.token, body: requestBody);

      if (response.isSuccess) {
        log("Code verification successed");
      } else {
        errorSnakbar(errorMessage: response.errorMessage);
      }
    } catch (e) {
      log("Something went wrong, error: $e");
    }
  }

  Future<void> verifyCodeDeliverd(String token) async {
    try {
      final Map<String, String> requestBody = {
        "token": token,
      };

      final response = await networkCaller.postRequest(
          AppUrls.verifyCodeDeliverd,
          token: AuthService.token,
          body: requestBody);

      if (response.isSuccess) {
        log("Code verification successed");
      } else {
        errorSnakbar(errorMessage: response.errorMessage);
      }
    } catch (e) {
      log("Something went wrong, error: $e");
    }
  }
}
