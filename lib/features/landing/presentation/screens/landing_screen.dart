import 'package:courierapp/features/create_trip/presentation/screens/chose_transport_screen.dart';
import 'package:courierapp/features/landing/bottom_nav_bar/custom_bottom_nav_bar.dart';
import 'package:courierapp/features/landing/controller/landing_controller.dart';
import 'package:courierapp/features/my_trip/presentation/screens/my_trip_screen.dart';
import 'package:courierapp/features/profile/presentation/screens/profile_screen.dart';
import 'package:courierapp/features/search_screen/presentation/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(),
      body: PageView(
        controller: Get.find<LandingController>().pageController,
        onPageChanged: (value) {
          Get.find<LandingController>().currentPage.value = value;
        },
        children: [
          SearchScreen(),
          MyTripScreen(),
          ChoseTransportScreen(),
          ProfileScreen(),
        ],
      ),
    );
  }
}
