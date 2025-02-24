import 'package:courierapp/core/common/widgets/create_trip_top_body.dart';
import 'package:courierapp/core/common/widgets/custom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/error_snakbar.dart';
import 'package:courierapp/core/common/widgets/message_notification_box.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/features/authentication/presentation/components/select_identity_card.dart';
import 'package:courierapp/features/create_trip/controller/create_trip_controller.dart';
import 'package:courierapp/features/create_trip/presentation/screens/car_number_screen.dart';
import 'package:courierapp/features/landing/controller/landing_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChoseTransportScreen extends StatefulWidget {
  const ChoseTransportScreen({super.key});

  @override
  State<ChoseTransportScreen> createState() => _ChoseTransportScreenState();
}

class _ChoseTransportScreenState extends State<ChoseTransportScreen> {
  final CreateTripController tripController = Get.find<CreateTripController>();

  final LandingController landingController = Get.find<LandingController>();
  @override
  void initState() {
    super.initState();
    tripController.clearForm();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        ontapBackButton: () {
          landingController.changePage(0);
          tripController.clearForm();
        },
        actions: [
          Padding(
            padding: EdgeInsets.only(
                top: getHeight(6), bottom: getHeight(6), right: getWidth(12)),
            child: MessageNotificationBox(),
          )
        ],
      ),
      body: SizedBox(
        height: AppSizes.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CreateTripTopBody(title: "Create a trip"),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Choose your type of transport",
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: getWidth(16),
                    ),
                    VerticalSpace(height: getHeight(20)),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: getHeight(10)),
                            child: GestureDetector(
                                onTap: () {
                                  tripController.selectTransportType(index);
                                },
                                child: Obx(
                                  () => SelectIdentityCard(
                                      isSelected:
                                          tripController.selectedIndex.value ==
                                              index,
                                      iconPath: tripController.iconPaths[index],
                                      title: tripController.titles[index]),
                                )),
                          );
                        }),
                    Spacer(),
                    CustomButton(
                        height: getHeight(50),
                        onPressed: () {
                          if (tripController.selectedIndex.value < 4) {
                            Get.to(
                              () => CarNumberScreen(),
                              transition: Transition.rightToLeftWithFade,
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeOut,
                            );
                          } else {
                            errorSnakbar(
                                errorMessage:
                                    "Please select your transport type");
                          }
                        },
                        child: CustomText(
                          text: "Next",
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        )),
                    VerticalSpace(height: getHeight(15))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
