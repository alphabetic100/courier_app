import 'dart:developer';

import 'package:courierapp/core/common/widgets/error_snakbar.dart';
import 'package:courierapp/core/common/widgets/progress_indicator.dart';
import 'package:courierapp/core/services/Auth_service.dart';
import 'package:courierapp/core/services/network_caller.dart';
import 'package:courierapp/core/utils/constants/api_constants.dart';
import 'package:courierapp/features/search_screen/models/all_trip_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/common/widgets/item.dart';
import '../../../core/utils/constants/image_path.dart';

class SearchScreenController extends GetxController {
  final NetworkCaller networkCaller = NetworkCaller();
  RxBool hasNotification = true.obs;
  final TextEditingController senderController = TextEditingController();
  final TextEditingController receiverController = TextEditingController();
  final TextEditingController calenderController = TextEditingController();

  RxString searchDate = "".obs;

  Rx<AllTripModel?> searchData = Rx<AllTripModel?>(null);

  Future<void> searchTrip() async {
    final requestUrl =
        "${AppUrls.transport}?from=${senderController.text}&to=${receiverController.text}&date=${calenderController.text}";
    log(requestUrl);
    try {
      showProgressIndicator();
      final response =
          await networkCaller.getRequest(requestUrl, token: AuthService.token);
      hideProgressIndicator();
      if (response.isSuccess) {
        searchData.value = AllTripModel.fromJson(response.responseData);
      } else {
        errorSnakbar(errorMessage: response.errorMessage);
      }
    } catch (e) {
      log("something went wrong, error: $e");
    }
  }

  Future selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (selectedDate != null) {
      searchDate.value = DateFormat('EEEE, MMMM d').format(selectedDate);
      calenderController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
    }
  }

  clearTextFields() {
    senderController.clear();
    receiverController.clear();
    calenderController.clear();
  }

  var items = <Item>[
    Item(
        name: 'Laptop',
        destination: 'New York',
        weight: '09 kg',
        from: "Madrid",
        imagePath: ImagePath.onboarding1),
    Item(
        name: 'Books',
        destination: 'Chicago',
        weight: '16 kg',
        from: "Cicago",
        imagePath: ImagePath.onboarding2),
  ].obs;
}
