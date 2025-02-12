import 'package:courierapp/core/common/styles/get_text_style.dart';
import 'package:courierapp/core/common/widgets/body_profile_card.dart';
import 'package:courierapp/core/common/widgets/custom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_bottom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/message_notification_box.dart';
import 'package:courierapp/core/common/widgets/trip_details_top_body.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/image_path.dart';
import 'package:courierapp/features/messege/presentation/screens/chat_screens.dart';
import 'package:courierapp/features/my_trip/controller/my_trip_controller.dart';
import 'package:courierapp/features/my_trip/presentation/widgets/qr_scanner_dialog.dart';
import 'package:courierapp/features/profile/presentation/screens/others_profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SenderRequestDetailsScreen extends StatelessWidget {
  SenderRequestDetailsScreen({super.key});
  final MyTripController myTripController = Get.find<MyTripController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: getWidth(16)),
            child: MessageNotificationBox(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TripDetailsTopBody(
              title: "Trip Details",
              departingFrom: "32,C.nuñez de balboa, Madrid",
              arrivingTo: "32,C.nuñez de balboa, Madrid",
              price: "32",
              priceSubText: r"10\kg",
              date: '522',
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(() => OthersProfileScreen());
                        },
                        child: BodyProfileCard(
                            isVerified: true,
                            profileImage: "",
                            profileName: "Devid x Jhon",
                            subtitle: "Laptop to New York (2.5kg)",
                            suffixIcon: SizedBox.shrink()),
                      ),

                      //  VerticalSpace(height: getHeight(16)),
                      CustomText(
                        text:
                            "This is a laptop that i want to send to Paris to my Brother as a gift.",
                        fontWeight: FontWeight.normal,
                        color: AppColors.bodyTextColor,
                        fontSize: getWidth(15),
                      ),
                      VerticalSpace(height: getHeight(16)),
                    ],
                  ),
                ),
                Divider(
                  color: AppColors.grey,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CustomText(
                            text: "Item name",
                            color: AppColors.titleTextColor,
                            fontWeight: FontWeight.w700,
                            fontSize: getWidth(15),
                          ),
                          HorizontalSpace(width: getWidth(5)),
                          CustomText(
                            text: "Laptop to New York",
                            fontWeight: FontWeight.w400,
                            fontSize: getWidth(15),
                          ),
                        ],
                      ),
                      VerticalSpace(height: getHeight(10)),
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: "Item descritiion:",
                            style: getTextStyleMsrt(
                              color: AppColors.titleTextColor,
                              fontWeight: FontWeight.w700,
                              fontSize: getWidth(15),
                            )),
                        TextSpan(
                            text:
                                " A laptop computer for work. Model- Lenovo Legion. ",
                            style: getTextStyleMsrt(
                              color: AppColors.grey,
                              fontWeight: FontWeight.w400,
                              fontSize: getWidth(15),
                            ))
                      ])),
                      VerticalSpace(height: getWidth(10)),
                      Row(
                        children: [
                          CustomText(
                            text: "Status:",
                            color: AppColors.titleTextColor,
                            fontSize: getWidth(15),
                            fontWeight: FontWeight.w700,
                          ),
                          HorizontalSpace(width: getWidth(5)),
                          CustomText(
                            text: "Request Panding",
                            color: AppColors.secondaryColor,
                            fontSize: getWidth(15),
                            fontWeight: FontWeight.w600,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                VerticalSpace(height: getHeight(16)),
                Divider(
                  color: AppColors.grey,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
                  child: Column(
                    children: [
                      VerticalSpace(height: getHeight(16)),
                      SizedBox(
                        height: getHeight(200),
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(right: getWidth(10)),
                                child: Container(
                                  height: getHeight(180),
                                  width: AppSizes.width * 0.7,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(getWidth(12)),
                                    image: DecorationImage(
                                        image: AssetImage(
                                          ImagePath.productPhoto,
                                        ),
                                        fit: BoxFit.contain),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
                VerticalSpace(height: getHeight(20)),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(
        isPrimaryButton: false,
        onTap: () {},
        secondaryWidget: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.error_outline,
              color: AppColors.secondaryColor,
            ),
            HorizontalSpace(width: 5),
            Expanded(
              child: CustomText(
                text:
                    "To confirm that you picked up the parcel, please scan the QR code provided by sender.",
                fontSize: getWidth(14),
                fontWeight: FontWeight.normal,
              ),
            )
          ],
        ),
        primaryWidget: Row(
          children: [
            Expanded(
              flex: 1,
              child: CustomButton(
                  isPrimary: false,
                  onPressed: () {
                    Get.to(() => ChatInboxScreen());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.bubble_left,
                        color: AppColors.grey,
                        size: getHeight(28),
                      ),
                    ],
                  )),
            ),
            HorizontalSpace(width: getWidth(16)),
            Expanded(
              flex: 4,
              child: CustomButton(
                  isPrimary: true,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return QrScannerDialog();
                        });
                  },
                  child: CustomText(
                    text: "Scan QR Code",
                    fontWeight: FontWeight.bold,
                    fontSize: getWidth(18),
                    color: AppColors.white,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
