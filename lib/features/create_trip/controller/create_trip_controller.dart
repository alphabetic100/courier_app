import 'dart:developer';

import 'package:courierapp/core/common/widgets/error_snakbar.dart';
import 'package:courierapp/core/common/widgets/progress_indicator.dart';
import 'package:courierapp/core/common/widgets/success_snakbar.dart';
import 'package:courierapp/core/services/Auth_service.dart';
import 'package:courierapp/core/services/network_caller.dart';
import 'package:courierapp/core/utils/constants/api_constants.dart';
import 'package:courierapp/core/utils/constants/icon_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CreateTripController extends GetxController {
//Network Caller
  final NetworkCaller networkCaller = NetworkCaller();

  //Text Editin Controllers and required variables
  final TextEditingController dateTimeController = TextEditingController();

  final TextEditingController carNumberController = TextEditingController();
  final TextEditingController selectDepartingController =
      TextEditingController();
  final TextEditingController selectArrivingController =
      TextEditingController();
  final TextEditingController setRulesController = TextEditingController();

  String selectedTransportType = "";
  String date = "";
  RxDouble itemWeight = 1.0.obs;
  List<String> rulesSet = [];
  String selectedIconPath = "";

  // Helper variable
  RxInt selectedIndex = 4.obs;
  RxString departingLocation = "".obs;
  RxBool isUnlimited = false.obs;

  final List<String> titles = ["Car", "Train", "Buss", "Airplane"];
  final List<String> iconPaths = [
    IconPath.car,
    IconPath.train,
    IconPath.directionsBus,
    IconPath.plane
  ];

//Create trip
  Future<void> createTrip() async {
    final Map<String, dynamic> requestBody = {
      "transport": selectedTransportType,
      "date": date,
      "from": selectDepartingController.text,
      "to": selectArrivingController.text,
      "weight": itemWeight.value,
      "rulse": rulesSet,
    };

    try {
      log(requestBody.toString());
      showProgressIndicator();
      log(AuthService.token.toString());
      final response = await networkCaller.postRequest(AppUrls.createTransport,
          token: AuthService.token, body: requestBody);
      hideProgressIndicator();
      if (response.isSuccess) {
        successSnakbr(successMessage: "Trip is created successfully");
      } else {
        errorSnakbar(errorMessage: response.errorMessage);
      }
    } catch (e) {
      log("something went wrong, error:$e");
    } finally {
      hideProgressIndicator();
    }
  }

  addrule() {
    rulesSet.add(setRulesController.text);
    setRulesController.clear();
  }

  selectTransportType(int index) {
    selectedIndex.value = index;
    selectedTransportType = titles[index];
    selectedIconPath = iconPaths[index];
  }

  Future selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      date = selectedDate.toUtc().toIso8601String();
      log(date);
      dateTimeController.text = DateFormat('EEEE, MMMM d').format(selectedDate);
    }
  }

  @override
  void onInit() {
    super.onInit();
    selectedIndex.value = 4;
  }
}
