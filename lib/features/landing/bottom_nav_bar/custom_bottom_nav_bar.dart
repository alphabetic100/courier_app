import 'package:courierapp/core/common/styles/get_text_style.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
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
        backgroundColor: Color(0xFF000000),
        currentIndex: landingController.currentPage.value,
        selectedItemColor: AppColors.white,
        unselectedItemColor: Color(0xFF777C7C),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: (value) => landingController.changePage(value),
        items: List.generate(landingController.activeIcons.length, (index) {
          final isSelected = landingController.currentPage.value == index;

          return BottomNavigationBarItem(
            backgroundColor: Color(0xFF000000),
            icon: index == 3
                ? Stack(
                    children: [
                      isSelected
                          ? landingController.activeIcons[3]
                          : landingController.inActiveIcons[3],
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          child: Center(
                            child: Text(
                              landingController.notifications.value.toString(),
                              style:
                                  getTextStyleMsrt(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
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
