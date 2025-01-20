import 'package:courierapp/features/sender/authentication/controllers/login_controller.dart';
import 'package:courierapp/features/sender/authentication/controllers/sing_up_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    // LoginController
    Get.lazyPut<LoginController>(
      () => LoginController(),
      fenix: true,
    );

    // SignUpController
    Get.lazyPut<SingUpController>(
      () => SingUpController(),
      fenix: true,
    );
  }
}
