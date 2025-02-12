import 'dart:io';

import 'package:courierapp/features/splash_screen/presentation/screens/onboarding_screen_1.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../../core/services/Auth_service.dart';
import '../../../core/services/location_service.dart';
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
        // Get.offAll(() => OnboardingScreen1());
      },
    );
  }


  @override
  void onInit() {
    super.onInit();

    if (Platform.isIOS) {
      fetchLocationForIOS();
    } else if (Platform.isAndroid) {
      fetchLocationForAndroid();
    }
  }

  static var latitude = 0.0.obs;
  static var  longitude = 0.0.obs;
  var address = '......'.obs;

  final LocationService _locationService = LocationService();



  Future<void> fetchLocationForIOS() async {
    await _fetchLocation();
  }

  Future<void> fetchLocationForAndroid() async {
    await _fetchLocation();
  }

  Future<void> _fetchLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      debugPrint('Location services are disabled.');
      return;
    }

    // Check and request location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        debugPrint('Location permissions are denied.');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      debugPrint('Location permissions are permanently denied.');
      return;
    }

    try {
      // Fetch current location
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      latitude.value = position.latitude;
      longitude.value = position.longitude;

      debugPrint('Latitude: ${latitude.value}');
      debugPrint('Longitude: ${longitude.value}');

      // Reverse geocode to get address
      List<Placemark> placemarks = await placemarkFromCoordinates(
          position.latitude, position.longitude);

      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks.first;

        String fullAddress = [
          placemark.subLocality,
          placemark.locality,
          placemark.country,
        ]
            .where((element) => element != null && element.isNotEmpty)
            .join(', ');

        _locationService.setLocation(
            latitude.value, longitude.value, fullAddress);
        navigateToOnboardingScreen();
        debugPrint('Address: $fullAddress');
      } else {
        debugPrint('No placemarks found for the location.');
      }
    } catch (e) {
      debugPrint('Error fetching location: $e');
    }
  }
}
