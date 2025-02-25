import 'package:courierapp/core/common/styles/get_text_style.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/features/landing/controller/landing_controller.dart';
import 'package:courierapp/features/my_trip/controller/my_trip_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/constants/app_colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  CustomBottomNavBar({super.key});
  final LandingController landingController = Get.find<LandingController>();
  final MyTripController myTripController = Get.find<MyTripController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final totalPendingRequest =
          myTripController.totalPendingRequest.value.toString();
      return BottomNavigationBar(
        selectedLabelStyle: getTextStyleMsrt(
            fontSize: getWidth(14), fontWeight: FontWeight.w600),
        unselectedLabelStyle: getTextStyleMsrt(
            fontSize: getWidth(14), color: AppColors.bodyTextColor),
        backgroundColor: AppColors.white,
        currentIndex: landingController.currentPage.value,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.shifting,
        onTap: (value) => landingController.changePage(value),
        items: List.generate(landingController.activeIcons.length, (index) {
          final isSelected = landingController.currentPage.value == index;
          return BottomNavigationBarItem(
            backgroundColor: AppColors.white,
            icon: index == 1
                ? isSelected
                    ? myTripController.totalPendingRequest.value != 0
                        ? Stack(
                            children: [
                              landingController.activeIcons[index],
                              Positioned(
                                top: -6,
                                right: 0,
                                child: Container(
                                  padding: EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.error,
                                  ),
                                  child: CustomText(
                                    text: totalPendingRequest,
                                    color: AppColors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : landingController.activeIcons[index]
                    : myTripController.totalPendingRequest.value != 0
                        ? Stack(
                            children: [
                              landingController.inActiveIcons[index],
                              Positioned(
                                top: -6,
                                right: 0,
                                child: Container(
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.error,
                                  ),
                                  child: CustomText(
                                    text: "1",
                                    color: AppColors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : landingController.inActiveIcons[index]
                : isSelected
                    ? landingController.activeIcons[index]
                    : landingController.inActiveIcons[index],
            label: landingController.labels[index],
          );
        }),
      );
    });
  }
}
