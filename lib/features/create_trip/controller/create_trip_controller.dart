import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CreateTripController extends GetxController {
  final TextEditingController dateTimeController = TextEditingController();
  final TextEditingController carNumberController = TextEditingController();
  final TextEditingController setRulesController = TextEditingController();
  RxInt selectedIndex = 4.obs;
  RxString departingLocation = "".obs;
  RxBool isUnlimited = false.obs;
  RxDouble itemWeight = 1.0.obs;

  Future selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (selectedDate != null) {
      dateTimeController.text = DateFormat('EEEE, MMMM d').format(selectedDate);
    }
  }

  @override
  void onInit() {
    super.onInit();
    selectedIndex.value = 4;
  }
}
