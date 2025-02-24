import 'dart:developer';

import 'package:courierapp/core/common/widgets/error_snakbar.dart';
import 'package:courierapp/core/common/widgets/progress_indicator.dart';
import 'package:courierapp/core/common/widgets/success_snakbar.dart';
import 'package:courierapp/core/services/Auth_service.dart';
import 'package:courierapp/core/services/network_caller.dart';
import 'package:courierapp/core/utils/constants/api_constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class RattingController extends GetxController {
  final NetworkCaller networkCaller = NetworkCaller();
  RxInt selectedIndex = (-1).obs;
  final TextEditingController feedBackComment = TextEditingController();

  void updateRating(int index) {
    selectedIndex.value = index + 1;
    log(selectedIndex.value.toString());
  }

  Future<void> giveReview(String bookingID) async {
    if (feedBackComment.text.isEmpty || selectedIndex.value < 0) {
      return;
    }

    try {
      showProgressIndicator();
      final requestBody = {
        "bookingId": bookingID,
        "rating": selectedIndex.value,
        "comment": feedBackComment.text.trim(),
      };

      final response = await networkCaller.postRequest(AppUrls.postReview,
          token: AuthService.token, body: requestBody);
      hideProgressIndicator();

      if (response.isSuccess) {
        Future.delayed(Duration(milliseconds: 200), () {
          successSnakbr(successMessage: "Review added successfully");
        });
        feedBackComment.clear();
        selectedIndex.value = -1;
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

  @override
  void onInit() {
    super.onInit();
    feedBackComment.clear();
    selectedIndex.value = -1;
  }
}
