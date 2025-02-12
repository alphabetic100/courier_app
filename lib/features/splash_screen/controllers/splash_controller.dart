import 'package:courierapp/features/splash_screen/presentation/screens/onboarding_screen_1.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';

import '../../../core/services/Auth_service.dart';
import '../../landing/presentation/screens/landing_screen.dart';

class SplashController extends GetxController {
  void navigateToOnboardingScreen() {
    Future.delayed(
      const Duration(milliseconds: 1500),
      () {
        if (AuthService.hasToken()) {
          Get.offAll(() => LandingScreen());
        } else {
          Get.offAll(
            () => const OnboardingScreen1(),
            transition: Transition.rightToLeftWithFade,
            duration: Duration(milliseconds: 400),
            curve: Curves.easeOut,
          );
        }
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    navigateToOnboardingScreen();
  }
}
