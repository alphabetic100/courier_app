import 'dart:developer';

import 'package:courierapp/core/common/widgets/error_snakbar.dart';
import 'package:courierapp/core/common/widgets/progress_indicator.dart';
import 'package:courierapp/core/common/widgets/success_snakbar.dart';
import 'package:courierapp/core/services/Auth_service.dart';
import 'package:courierapp/core/services/network_caller.dart';
import 'package:courierapp/core/utils/constants/api_constants.dart';
import 'package:courierapp/core/utils/constants/icon_path.dart';
import 'package:courierapp/features/landing/controller/landing_controller.dart';
import 'package:courierapp/features/landing/presentation/screens/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CreateTripController extends GetxController {
//Network Caller
  final NetworkCaller networkCaller = NetworkCaller();
  final LandingController landingController = Get.find<LandingController>();

  //Text Editin Controllers and required variables
  final TextEditingController dateTimeController = TextEditingController();

  final TextEditingController carNumberController = TextEditingController();
  final TextEditingController selectDepartingController =
      TextEditingController();
  final TextEditingController selectArrivingController =
      TextEditingController();
  final TextEditingController setRulesController = TextEditingController();
  final TextEditingController setAdditionalSupport = TextEditingController();

  String selectedTransportType = "";
  String date = "";
  String weight = "";
  RxDouble itemWeight = 1.0.obs;

  RxList<String> rulesSet = <String>[].obs;
  RxList<String> supportSet = <String>[].obs;
  String selectedIconPath = "";

  // Helper variable
  RxInt selectedIndex = 4.obs;
  RxString departingLocation = "1.0".obs;
  RxBool isUnlimited = false.obs;

  final List<String> titles = ["Car", "Train", "Bus", "Airplane"];
  final List<String> iconPaths = [
    IconPath.car,
    IconPath.train,
    IconPath.directionsBus,
    IconPath.plane
  ];

  final List<String> chargeRange = [
    '\$1',
    '\$2',
    '\$3',
    '\$4',
    '\$5',
    '\$6',
    '\$7',
    '\$8',
    '\$9',
    '\$10',
  ];
  RxString selectedCharge = "\$4".obs;

  var lat1 = 0.0;
  var lat2 = 0.0;
  var long1 = 0.0;
  var long2 = 0.0;

//Create trip
  Future<void> createTrip() async {
    final Map<String, dynamic> requestBody = {
      "transportType": selectedTransportType,
      "transportNumber": carNumberController.text.trim(),
      "date": date,
      "from": selectDepartingController.text.trim(),
      "to": selectArrivingController.text.trim(),
      "weight": weight,
      "price": int.parse(selectedCharge.value.replaceAll("\$", "")),
      "rulse": rulesSet.toList(),
      "additional": supportSet.toList(),
      "lat1": lat1,
      "lon1": long1,
      "lat2": lat2,
      "lon2": long2
    };

    try {
      log(requestBody.toString());
      showProgressIndicator();
      log(AuthService.token.toString());
      final response = await networkCaller.postRequest(AppUrls.createTransport,
          token: AuthService.token, body: requestBody);
      hideProgressIndicator();
      debugPrint(response.statusCode.toString());
      if (response.isSuccess) {
        debugPrint("--------------------------------------------------");
        debugPrint(
            "---------------------${response.responseData}--------------------------");
        successSnakbr(successMessage: "Trip is created successfully");
        landingController.currentPage.value = 0;
        Get.offAll(() => LandingScreen());
      } else {
        errorSnakbar(errorMessage: response.errorMessage);
      }
    } catch (e) {
      log("something went wrong, error:$e");
    } finally {
      hideProgressIndicator();
    }
  }

//Add Rule Func
  addrule(String? value) {
    if (value != null && value.isNotEmpty) {
      rulesSet.add(value);
    }

    setRulesController.clear();
  }

//Add support Func
  addSupport(String? value) {
    if (value != null && value.isNotEmpty) {
      supportSet.add(value);
    }

    setAdditionalSupport.clear();
  }

//Weight Picker
  selectedWeight() {
    if (isUnlimited.value) {
      weight = "Unlimited";
    } else {
      weight = itemWeight.value.toString();
    }
  }

  getWeight() {
    weight = itemWeight.value.toString();
  }

//Select Transport Type
  selectTransportType(int index) {
    selectedIndex.value = index;
    selectedTransportType = titles[index];
    selectedIconPath = iconPaths[index];

    log(selectedIconPath);
  }

//Selete trip date
  Future selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      selectedDate = DateTime(
          selectedDate.year, selectedDate.month, selectedDate.day, 10, 30, 00);
      log("Picked Date is : $selectedDate");
      date = selectedDate.toUtc().toIso8601String();
      log("selected date is : $date");
      dateTimeController.text = DateFormat('EEEE, MMMM d').format(selectedDate);
    }
  }

  @override
  void onInit() {
    super.onInit();
    selectedIndex.value = 4;
    itemWeight.value = 1.0;
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    dateTimeController.dispose();
    carNumberController.dispose();
    selectDepartingController.dispose();
    selectArrivingController.dispose();
    setRulesController.dispose();
    setAdditionalSupport.dispose();
  }

  void clearForm() {
    selectedIndex.value = 4;
    dateTimeController.clear();
    carNumberController.clear();
    selectDepartingController.clear();
    selectArrivingController.clear();
    setRulesController.clear();
    setAdditionalSupport.clear();

    itemWeight.value = 1.0;
    isUnlimited.value = false;
  }
}
