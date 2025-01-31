import 'package:courierapp/features/create_trip/presentation/screens/create_trip_screen1.dart';
import 'package:courierapp/features/landing/bottom_nav_bar/custom_bottom_nav_bar.dart';
import 'package:courierapp/features/landing/controller/landing_controller.dart';
import 'package:courierapp/features/my_trip/presentation/screens/my_trip_screen.dart';
import 'package:courierapp/features/profile/presentation/screens/profile_screen.dart';
import 'package:courierapp/features/search_screen/presentation/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingScreen extends StatelessWidget {
  LandingScreen({super.key});
  final LandingController landingController = Get.find<LandingController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(),
      body: PageView(
        controller: landingController.pageController,
        onPageChanged: (value) {
          landingController.currentPage.value = value;
        },
        children: [
          SearchScreen(),
          MyTripScreen(),
          CreateTripScreen1(),
          ProfileScreen(),
        ],
      ),
    );
  }
}
