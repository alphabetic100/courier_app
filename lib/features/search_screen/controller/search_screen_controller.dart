import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/common/widgets/item.dart';
import '../../../core/utils/constants/image_path.dart';

class SearchScreenController extends GetxController {
  RxBool hasNotification = true.obs;
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
