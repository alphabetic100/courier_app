import 'package:courierapp/features/landing/controller/landing_controller.dart';
import 'package:courierapp/features/request_shipping/controller/request_shipping_controller.dart';
import 'package:courierapp/features/search_screen/controller/search_screen_controller.dart';
import 'package:courierapp/features/authentication/controllers/login_controllers/login_controller.dart';
import 'package:courierapp/features/authentication/controllers/login_controllers/otp_controller.dart';
import 'package:courierapp/features/authentication/controllers/signup_controllers/identity_verification_controller.dart';
import 'package:courierapp/features/authentication/controllers/signup_controllers/sing_up_controller.dart';
import 'package:courierapp/features/search_screen/controller/trip_overview_controller.dart';
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

    //Identity Verification Controller
    Get.lazyPut<IdentityVerificationController>(
      () => IdentityVerificationController(),
      fenix: true,
    );

    //Search screen controller
    Get.lazyPut<SearchScreenController>(
      () => SearchScreenController(),
      fenix: true,
    );

    //Trip overview Details controller
    Get.lazyPut<TripOverviewController>(
      () => TripOverviewController(),
      fenix: true,
    );

    //Request Shipping controller
    Get.lazyPut<RequestShippingController>(
      () => RequestShippingController(),
      fenix: true,
    );
  }
}
