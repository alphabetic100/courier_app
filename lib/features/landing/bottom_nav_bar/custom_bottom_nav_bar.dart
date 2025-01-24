import 'package:courierapp/core/common/styles/get_text_style.dart';
import 'package:courierapp/features/landing/controller/landing_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/constants/app_colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  CustomBottomNavBar({super.key});
  final LandingController landingController = Get.find<LandingController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return BottomNavigationBar(
        selectedLabelStyle:
            getTextStyleMsrt(fontSize: 16, fontWeight: FontWeight.bold),
        unselectedLabelStyle:
            getTextStyleMsrt(fontSize: 14, color: AppColors.bodyTextColor),
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
            icon: isSelected
                ? landingController.activeIcons[index]
                : landingController.inActiveIcons[index],
            label: landingController.labels[index],
          );
        }),
      );
    });
  }
}
