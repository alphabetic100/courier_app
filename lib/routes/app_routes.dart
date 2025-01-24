import 'package:courierapp/features/landing/presentation/screens/landing_screen.dart';
import 'package:courierapp/features/sender/authentication/presentation/screens/log_in_screens/forget_password_screen.dart';
import 'package:courierapp/features/sender/authentication/presentation/screens/log_in_screens/login_screen.dart';
import 'package:courierapp/features/sender/authentication/presentation/screens/log_in_screens/reset_password_screen.dart';
import 'package:courierapp/features/sender/authentication/presentation/screens/sign_up_screens/payment_setup_screen.dart';
import 'package:courierapp/features/sender/authentication/presentation/screens/sign_up_screens/sign_up_screen.dart';
import 'package:courierapp/features/splash_screen/presentation/screens/onboarding_screen_1.dart';
import 'package:courierapp/features/splash_screen/presentation/screens/onboarding_screen_2.dart';
import 'package:courierapp/features/splash_screen/presentation/screens/onboarding_screen_3.dart';
import 'package:courierapp/features/splash_screen/presentation/screens/select_rule_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../features/splash_screen/presentation/screens/splash_screen.dart';

class AppRoute {
  static String init = "/";
  static String onboarding1 = "/onboarding1";
  static String onboarding2 = "/onboarding2";
  static String onboarding3 = "/onboarding3";
  static String landingScreen = "/landingScreen";

  static String loginScreen = "/loginScreen";
  static String selectRuleScreen = "/selectRuleScreen";
  static String signUpScreen = "/signUpScreen";
  static String forgetPassword = "/forgetPassword";
  static String createNewPassword = "/createNewPassword";

  static String paymentSetupScreen = "/paymentSetupScreen";

  static List<GetPage> routes = [
    //Splash Screen: initial screen
    GetPage(name: init, page: () => SplashScreen()),

    //Onboarding Screens
    GetPage(
      name: onboarding1,
      page: () => const OnboardingScreen1(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    ),
    GetPage(
      name: onboarding2,
      page: () => const OnboardingScreen2(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    ),
    GetPage(
      name: onboarding3,
      page: () => const OnboardingScreen3(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    ),

// ------------------------------------------------------------------------------------------------
    //                      SENDER ROUTES

    //Landing screen
    // GetPage(name: landingScreen, page: () => const LandingScreen()),

    //Auth Screens
    GetPage(name: loginScreen, page: () => LoginScreen()),
    GetPage(name: selectRuleScreen, page: () => SelectRuleScreen()),
    GetPage(name: signUpScreen, page: () => SignUpScreen()),
    GetPage(name: forgetPassword, page: () => ForgetPasswordScreen()),
    GetPage(name: createNewPassword, page: () => ResetPasswordScreen()),

    //Payment Setup Screen
    GetPage(name: paymentSetupScreen, page: () => const PaymentSetupScreen()),

    //Home Screen
    // GetPage(name: homeScreen, page: () => const HomeScreen()),

    //-------------------------------------------------------------------------------------------------
    //    Landing Screen
    GetPage(name: landingScreen, page: () => LandingScreen()),
  ];
}
