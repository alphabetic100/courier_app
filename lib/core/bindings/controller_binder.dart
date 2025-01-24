import 'package:courierapp/features/landing/controller/landing_controller.dart';
import 'package:courierapp/features/sender/authentication/controllers/login_controllers/login_controller.dart';
import 'package:courierapp/features/sender/authentication/controllers/reset_password_controllers/otp_controller.dart';
import 'package:courierapp/features/sender/authentication/controllers/signup_controllers/sing_up_controller.dart';
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

    //Landing Screen Controller
    Get.lazyPut<LandingController>(
      () => LandingController(),
      fenix: true,
    );

    //OTP Controller
    Get.lazyPut<OtpController>(
      () => OtpController(),
      fenix: true,
    );
  }
}
