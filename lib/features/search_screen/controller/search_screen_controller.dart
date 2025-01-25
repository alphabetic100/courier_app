import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SearchScreenController extends GetxController {
  RxBool hasNotification = false.obs;
  final TextEditingController senderController = TextEditingController();
  final TextEditingController receiverController = TextEditingController();
  final TextEditingController calenderController = TextEditingController();
  final TextEditingController itemWeightController = TextEditingController();

  Future selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (selectedDate != null) {
      calenderController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
    }
  }
}
