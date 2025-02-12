import 'package:courierapp/core/common/styles/get_text_style.dart';
import 'package:courierapp/core/common/widgets/create_trip_top_body.dart';
import 'package:courierapp/core/common/widgets/custom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_bottom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/error_snakbar.dart';
import 'package:courierapp/core/common/widgets/message_notification_box.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/image_path.dart';
import 'package:courierapp/features/create_trip/controller/create_trip_controller.dart';
import 'package:courierapp/features/create_trip/presentation/screens/select_maximum_weight.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../splash_screen/controllers/splash_controller.dart';

class SelectArrivingToScreen extends StatefulWidget {
  SelectArrivingToScreen({super.key});

  @override
  State<SelectArrivingToScreen> createState() => _SelectArrivingToScreenState();
}

class _SelectArrivingToScreenState extends State<SelectArrivingToScreen> {
  final CreateTripController tripController = Get.find<CreateTripController>();
  GoogleMapController? mapController;

  late LatLng selectedLocation;

  @override
  void initState() {
    super.initState();

    // Ensure valid default coordinates
    double latitude = SplashController .latitude.value;
    double longitude = SplashController .longitude.value;

    if (latitude == 0.0 || longitude == 0.0) {
      latitude = 48.8566; // Default to Paris
      longitude = 2.3522;
    }

    selectedLocation = LatLng(latitude, longitude);
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<void> _onLocationSelected(LatLng latLng) async {
    setState(() {
      selectedLocation = latLng;
    });

    try {
      List<Placemark> placemarks =
      await placemarkFromCoordinates(latLng.latitude, latLng.longitude);

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        String address = "${place.locality}, ${place.country}";

        tripController.selectArrivingController.text = address;
      }
    } catch (e) {
      print("Error fetching address: $e");
      errorSnakbar(errorMessage: "Failed to fetch location details");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: getWidth(16)),
            child: MessageNotificationBox(),
          )
        ],
      ),
      body: Column(
        children: [
          CreateTripTopBody(title: "Create a Trip"),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Where are you arriving to?",
                    color: AppColors.black,
                    fontSize: getWidth(18),
                  ),
                  VerticalSpace(height: getHeight(10)),
                  CustomText(
                    text:
                        "Please put here the address where you are going to arrive with the items",
                    color: AppColors.bodyTextColor,
                    fontSize: getWidth(15),
                    fontWeight: FontWeight.normal,
                  ),
                  VerticalSpace(height: getHeight(10)),
                  TextField(
                    controller: tripController.selectArrivingController,
                    style: getTextStyleMsrt(),
                    readOnly: true,
                    decoration: InputDecoration(
                      suffixIcon: Padding(
                        padding: EdgeInsets.all(getWidth(16)),
                        child: Image.asset(
                          ImagePath.location,
                          height: getWidth(15),
                          color: AppColors.grey,
                        ),
                      ),
                      hintText: "Tap on the map to select a location",
                      hintStyle: getTextStyleMsrt(color: AppColors.grey),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  VerticalSpace(height: getHeight(20)),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.grey,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: GoogleMap(
                          onMapCreated: _onMapCreated,
                          initialCameraPosition: CameraPosition(
                            target: selectedLocation,
                            zoom: 12,
                          ),
                          markers: {
                            Marker(
                              markerId: MarkerId("selected_location"),
                              position: selectedLocation,
                              draggable: true,
                              onDragEnd: _onLocationSelected,
                            ),
                          },
                          onTap: _onLocationSelected,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: CustomBottomAppBar(
        isPrimaryButton: true,
        onTap: () {
          tripController.selectArrivingController.text.isNotEmpty
              ? Get.to(
                  () => SelectMaximumWeightScreen(),
                  transition: Transition.rightToLeftWithFade,
                   duration: const Duration(milliseconds: 200),
                  curve: Curves.easeOut,
                )
              : errorSnakbar(
                  errorMessage: "Please select where are you arriving to");
        },
      ),
    );
  }
}
