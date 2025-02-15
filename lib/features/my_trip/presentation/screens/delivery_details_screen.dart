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
import 'package:courierapp/features/my_trip/models/my_bookings_model.dart';
import 'package:courierapp/features/my_trip/presentation/widgets/qr_generate_dialog.dart';
import 'package:courierapp/features/profile/presentation/screens/traveller_profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryDetailsScreen extends StatelessWidget {
  const DeliveryDetailsScreen({super.key, required this.booking});

  final BookingData booking;
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
              title: "Delivery Details",
              departingFrom: "32,C.nuñez de balboa, Madrid",
              arrivingTo: "32,C.nuñez de balboa, Madrid",
              price: booking.price.toString(),
              priceSubText: r"12\kg",
              date: "12/24/12",
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
              child: GestureDetector(
                onTap: () {
                  Get.to(() => TravellerProfileScreen(),
                      arguments: booking.travelerId);
                },
                child: BodyProfileCard(
                    isVerified: booking.isVerified,
                    profileImage: booking.profileImage,
                    profileName: booking.fullName,
                    rattings: booking.averageRating.toString(),
                    suffixIcon: Icon(Icons.arrow_forward_ios)),
              ),
            ),
            Divider(
              color: Color(0xffCCD9D6),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CustomText(
                        text: "Item name: ",
                        fontSize: getWidth(14),
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                      HorizontalSpace(width: getWidth(5)),
                      Expanded(
                        child: CustomText(
                          text: booking.itemName,
                          fontSize: getWidth(14),
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
                  ),
                  Text.rich(TextSpan(children: [
                    TextSpan(
                        text: "Item descritiion: ",
                        style: getTextStyleMsrt(
                          color: AppColors.titleTextColor,
                          fontWeight: FontWeight.w700,
                          fontSize: getWidth(14),
                        )),
                    TextSpan(
                        text: booking.itemDescription,
                        style: getTextStyleMsrt(
                          color: AppColors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: getWidth(14),
                        ))
                  ])),
                  Row(
                    children: [
                      CustomText(
                        text: "Status:",
                        fontSize: getWidth(14),
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                      HorizontalSpace(width: getWidth(5)),
                      Expanded(
                        child: CustomText(
                          text: booking.status,
                          fontSize: getWidth(14),
                          fontWeight: FontWeight.w600,
                          color: AppColors.secondaryColor,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              color: Color(0xffCCD9D6),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
              child: SizedBox(
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
                            borderRadius: BorderRadius.circular(getWidth(12)),
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
            ),
            VerticalSpace(height: getHeight(20)),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(
        isPrimaryButton: false,
        onTap: () {},
        primaryWidget: Row(
          children: [
            Expanded(
              flex: 1,
              child: CustomButton(
                  isPrimary: false,
                  onPressed: () {
                    Get.to(() => ChatInboxScreen(
                          user2ndId: "",
                          //TODO: Chat user id
                        ));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.bubble_left,
                        color: AppColors.grey,
                        size: getHeight(28),
                      ),
                      if (booking.status != "pending") ...[
                        HorizontalSpace(width: getWidth(5)),
                        CustomText(
                          text: "Chat",
                          fontWeight: FontWeight.bold,
                          fontSize: getWidth(18),
                        )
                      ]
                    ],
                  )),
            ),
            if (booking.status == "pending") ...[
              HorizontalSpace(width: getWidth(16)),
              Expanded(
                flex: 4,
                child: CustomButton(
                    isPrimary: true,
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return QrGenerateDialog(
                              qrHEX: booking.bookingId,
                            );
                          });
                    },
                    child: CustomText(
                      text: "Generate QR Code",
                      fontWeight: FontWeight.bold,
                      fontSize: getWidth(18),
                      color: AppColors.white,
                    )),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
