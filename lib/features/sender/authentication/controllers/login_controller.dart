import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool rememberMe = false.obs;

  void toggleRememberMe() {
    rememberMe.value = !rememberMe.value;
  }

  login() {
    // login logic here
  }
}
