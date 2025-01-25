import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CreateTripController extends GetxController {
  final TextEditingController dateTimeController = TextEditingController();
  RxInt selectedIndex = 4.obs;
  RxString departingLocation = "".obs;

  Future selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (selectedDate != null) {
      dateTimeController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
    }
  }

  @override
  void onInit() {
    super.onInit();
    selectedIndex.value = 4;
  }
}
