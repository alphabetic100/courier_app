import 'package:courierapp/features/splash_screen/presentation/screens/onboarding_screen_1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  void navigateToOnboardingScreen() {
    Future.delayed(
      const Duration(milliseconds: 1500),
      () {
        Get.offAll(
          () => const OnboardingScreen1(),
          transition: Transition.rightToLeftWithFade,
          duration: Duration(milliseconds: 400),
          curve: Curves.easeOut,
        );
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    navigateToOnboardingScreen();
  }
}
