import 'package:get/get.dart';

class SenderReciverController extends GetxController {
  var selectedRule = ''.obs;

  void selectRule(String rule) {
    selectedRule.value = rule;
  }
}
