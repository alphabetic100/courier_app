import 'package:get/get.dart';

class SingUpController extends GetxController {
  RxBool termsAndConditions = false.obs;

  void toggleTermsAndConditions() {
    termsAndConditions.value = !termsAndConditions.value;
  }

  signUp() {
    // sign up logic here
  }
}
