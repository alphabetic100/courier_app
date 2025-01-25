import 'package:courierapp/routes/app_routes.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool rememberMe = false.obs;

  void toggleRememberMe() {
    rememberMe.value = !rememberMe.value;
  }

  login() {
    Get.toNamed(AppRoute.landingScreen);
    // login logic here
  }
}
