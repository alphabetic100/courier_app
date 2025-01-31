import 'package:get/get.dart';

class PaymentSetupController extends GetxController {
  RxInt selectedCard = 4.obs;


  var isChecked = false.obs;  // 'obs' makes it observable

  void toggleCheckbox() {
    isChecked.value = !isChecked.value;
  }
}
