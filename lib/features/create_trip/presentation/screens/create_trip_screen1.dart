import 'package:courierapp/core/common/widgets/create_trip_top_body.dart';
import 'package:courierapp/core/common/widgets/custom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/message_notification_box.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/icon_path.dart';
import 'package:courierapp/features/authentication/presentation/components/select_identity_card.dart';
import 'package:courierapp/features/create_trip/controller/create_trip_controller.dart';
import 'package:courierapp/features/create_trip/presentation/screens/create_trip_screen2.dart';
import 'package:courierapp/features/landing/controller/landing_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateTripScreen1 extends StatelessWidget {
  CreateTripScreen1({super.key});
  final CreateTripController tripController = Get.find<CreateTripController>();
  final LandingController landingController = Get.find<LandingController>();
  final List<String> titles = ["Car", "Train", "Buss", "Airplane"];
  final List<String> iconPaths = [
    IconPath.car,
    IconPath.train,
    IconPath.directionsBus,
    IconPath.plane
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        ontapBackButton: () {
          landingController.changePage(0);
        },
        actions: [
          Padding(
            padding: EdgeInsets.only(
                top: getHeight(6), bottom: getHeight(6), right: getWidth(12)),
            child: MessageNotificationBox(),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getWidth(12)),
        child: SizedBox(
          height: AppSizes.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CreateTripTopBody(title: "Create a trip"),
              CustomText(
                text: "Choose your type of transport",
                color: AppColors.black,
                fontWeight: FontWeight.bold,
                fontSize: getWidth(16),
              ),
              VerticalSpace(height: getHeight(20)),
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: getHeight(10)),
                        child: GestureDetector(
                            onTap: () {
                              tripController.selectedIndex.value = index;
                            },
                            child: Obx(
                              () => SelectIdentityCard(
                                  isSelected:
                                      tripController.selectedIndex.value ==
                                          index,
                                  iconPath: iconPaths[index],
                                  title: titles[index]),
                            )),
                      );
                    }),
              ),
              Spacer(),
              CustomButton(
                  onPressed: () {
                    Get.to(
                      () => CreateTripScreen2(),
                      transition: Transition.rightToLeftWithFade,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                  },
                  child: CustomText(
                    text: "Next",
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  )),
              VerticalSpace(height: getHeight(10))
            ],
          ),
        ),
      ),
    );
  }
}
