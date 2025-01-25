import 'package:courierapp/features/landing/presentation/screens/landing_screen.dart';
import 'package:courierapp/features/search_screen/presentation/screens/search_result_screen.dart';
import 'package:courierapp/features/search_screen/presentation/screens/search_screen.dart';
import 'package:courierapp/features/authentication/presentation/screens/log_in_screens/forget_password_screen.dart';
import 'package:courierapp/features/authentication/presentation/screens/log_in_screens/login_screen.dart';
import 'package:courierapp/features/authentication/presentation/screens/log_in_screens/reset_password_screen.dart';
import 'package:courierapp/features/authentication/presentation/screens/sign_up_screens/identity_verification_screen1.dart';
import 'package:courierapp/features/authentication/presentation/screens/sign_up_screens/identity_verification_screen2.dart';
import 'package:courierapp/features/authentication/presentation/screens/sign_up_screens/identity_verification_screen3.dart';
import 'package:courierapp/features/authentication/presentation/screens/sign_up_screens/payment_setup_screen.dart';
import 'package:courierapp/features/authentication/presentation/screens/sign_up_screens/payment_setup_screen2.dart';
import 'package:courierapp/features/authentication/presentation/screens/sign_up_screens/sign_up_screen.dart';
import 'package:courierapp/features/search_screen/presentation/screens/trip_overview_screen.dart';
import 'package:courierapp/features/splash_screen/presentation/screens/onboarding_screen_1.dart';
import 'package:courierapp/features/splash_screen/presentation/screens/onboarding_screen_2.dart';
import 'package:courierapp/features/splash_screen/presentation/screens/onboarding_screen_3.dart';
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
  static String signUpScreen = "/signUpScreen";
  static String forgetPassword = "/forgetPassword";
  static String createNewPassword = "/createNewPassword";

  static String identityVerificationScreen1 = "/IdentityVerificationScreen1";
  static String identityVerificationScreen2 = "/IdentityVerificationScreen2";
  static String identityVerificationScreen3 = "/IdentityVerificationScreen3";

  static String paymentSetupScreen = "/paymentSetupScreen";
  static String paymentSetupScreen2 = "/paymentSetupScreen";

  static String searchScreen = "/SearchScreen";
  static String searchResultScreen = "/searchresultScreen";

  static String tripOverviewScreen = "/tripOverviewScreen";

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

    //              Auth Screens
    //Login Screens
    GetPage(name: loginScreen, page: () => LoginScreen()),
    GetPage(name: forgetPassword, page: () => ForgetPasswordScreen()),
    GetPage(name: createNewPassword, page: () => ResetPasswordScreen()),
    //Signup Screens
    GetPage(name: signUpScreen, page: () => SignUpScreen()),
    GetPage(
      name: identityVerificationScreen1,
      page: () => IdentityVerificationScreen1(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    ),
    GetPage(
      name: identityVerificationScreen2,
      page: () => IdentityVerificationScreen2(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    ),
    GetPage(
      name: identityVerificationScreen3,
      page: () => IdentityVerificationScreen3(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    ),

    //Payment Setup Screen
    GetPage(
      name: paymentSetupScreen,
      page: () => PaymentSetupScreen(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    ),
    GetPage(
      name: paymentSetupScreen2,
      page: () => PaymentSetupScreen2(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    ),

    //-------------------------------------------------------------------------------------------------
    //           Landing Screen
    GetPage(name: landingScreen, page: () => LandingScreen()),

    //-------------------------------------------------------------------------------------------------
    //          Search Screeens
    GetPage(name: searchScreen, page: () => SearchScreen()),
    GetPage(name: searchResultScreen, page: () => SearchResultScreen()),
     GetPage(name: tripOverviewScreen, page: () => TripOverviewScreen()),
  ];
}
