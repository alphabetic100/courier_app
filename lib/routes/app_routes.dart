
import 'package:get/get.dart';

import '../features/splash_screen/presentation/screens/splash_screen.dart';



class AppRoute {
  static String init = "/";
  static String onboarding1 = "/onboarding1";
  static String onboarding2 = "/onboarding2";
  static String onboarding3 = "/onboarding3";
  static String navBarScreen = "/navBarScreen";
  static String changeBackgroundScreen = "/changeBackgroundScreen";
  static String createNewAlarmScreen = "/createNewAlarmScreen";

  static String loginScreen = "/loginScreen";


  static List<GetPage> routes = [
    GetPage(name: init, page: () => const SplashScreen()),
    // GetPage(name: onboarding1, page: () => const OnBoarding1Screen()),
    // GetPage(name: onboarding2, page: () => const OnBoarding2Screen()),
    // GetPage(name: onboarding3, page: () => const OnBoarding3Screen()),
    // GetPage(name: navBarScreen, page: () => const CreatorNavBar()),
    //
    // GetPage(name: loginScreen, page: () => const LoginScreen()),
    // GetPage(name: changeBackgroundScreen, page: () => const ChangeBackGroundAlarm()),
    // GetPage(name: createNewAlarmScreen, page: () => const CreateNewAlarmScreen ()),
  ];
}