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
import 'package:courierapp/features/messege/presentation/components/view_image_screen.dart';
import 'package:courierapp/features/messege/presentation/screens/chat_screens.dart';
import 'package:courierapp/features/my_trip/controller/booking_confirm_controller.dart';
import 'package:courierapp/features/my_trip/controller/my_trip_controller.dart';
import 'package:courierapp/features/my_trip/presentation/widgets/qr_scanner_dialog.dart';
import 'package:courierapp/features/profile/presentation/screens/traveller_profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SenderRequestDetailsScreen extends StatefulWidget {
  const SenderRequestDetailsScreen({super.key, required this.bookingId});
  final String bookingId;

  @override
  State<SenderRequestDetailsScreen> createState() =>
      _SenderRequestDetailsScreenState();
}

class _SenderRequestDetailsScreenState
    extends State<SenderRequestDetailsScreen> {
  final MyTripController myTripController = Get.find<MyTripController>();
  final BookingConfirmController bookingConfirmController =
      Get.put(BookingConfirmController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myTripController.getMyBookingAsTraveller(widget.bookingId);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (myTripController.isbookingLoading.value) {
        return Scaffold(
          appBar: CustomAppBar(),
          body: Center(
            child: SpinKitFadingCircle(
              color: AppColors.primaryColor,
              size: getWidth(50),
            ),
          ),
        );
      } else if (myTripController.bookingRequest.value == null) {
        return Scaffold(
          appBar: CustomAppBar(),
          body: Center(
            child: CustomText(text: "Something went wrong, please try again"),
          ),
        );
      } else {
        final details = myTripController.bookingRequest.value!.data;
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
                  departingFrom: details.transport.from,
                  arrivingTo: details.transport.to,
                  price: details.price.toString(),
                  priceSubText: "${details.item.weight}/kg",
                  date: DateFormat("MMM d, yyyy")
                      .format(DateTime.parse(details.transport.date)),
                  lat1: details.transport.lat1,
                  lon1: details.transport.lon1,
                  lat2: details.transport.lat2,
                  lon2: details.transport.lon2,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(() => TravellerProfileScreen(),
                                  arguments: details.user.id);
                            },
                            child: BodyProfileCard(
                                isVerified: details.user.isVerified,
                                profileImage: details.user.profileImage ?? "",
                                profileName: details.user.fullName,
                                subtitle:
                                    "${details.item.name} (${details.item.weight}kg)",
                                suffixIcon: SizedBox.shrink()),
                          ),

                          //  VerticalSpace(height: getHeight(16)),
                          if (details.message1.isNotEmpty) ...[
                            CustomText(
                              text: details.message1,
                              fontWeight: FontWeight.normal,
                              color: AppColors.bodyTextColor,
                              fontSize: getWidth(15),
                            ),
                            VerticalSpace(height: getHeight(16)),
                          ]
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
                          if (details.item.name.isNotEmpty) ...[
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
                                  text: details.item.name,
                                  fontWeight: FontWeight.w400,
                                  fontSize: getWidth(15),
                                ),
                              ],
                            ),
                            VerticalSpace(height: getHeight(10)),
                          ],
                          Text.rich(TextSpan(children: [
                            TextSpan(
                                text: "Item descritiion:",
                                style: getTextStyleMsrt(
                                  color: AppColors.titleTextColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: getWidth(15),
                                )),
                            TextSpan(
                                text: " ${details.item.description}",
                                style: getTextStyleMsrt(
                                  color: AppColors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: getWidth(15),
                                ))
                          ])),
                          VerticalSpace(height: getWidth(10)),
                          Text.rich(TextSpan(
                            children: [
                              TextSpan(
                                  text: "Status: ",
                                  style: getTextStyleMsrt(
                                    color: AppColors.titleTextColor,
                                    fontSize: getWidth(15),
                                    fontWeight: FontWeight.w700,
                                  )),
                              //  HorizontalSpace(width: getWidth(5)),
                              TextSpan(
                                  text: details.status == "pending"
                                      ? "Pending Confirmation"
                                      : details.status == "accepted"
                                          ? "Ready for pickup."
                                          : details.status == "pickupped"
                                              ? "The item is being transported to the destination."
                                              : details.status == "delivered"
                                                  ? "The parcel has been successfully delivered."
                                                  : details.status,
                                  style: getTextStyleMsrt(
                                    color: details.status == "pending"
                                        ? AppColors.warning
                                        : details.status == "delivered"
                                            ? AppColors.success
                                            : AppColors.secondaryColor,
                                    fontSize: getWidth(15),
                                    fontWeight: FontWeight.w500,
                                  ))
                            ],
                          )),
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
                                itemCount: details.item.image.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding:
                                        EdgeInsets.only(right: getWidth(10)),
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.to(() => ViewImageScreen(
                                              imageUrl:
                                                  details.item.image[index],
                                            ));
                                      },
                                      child: Container(
                                        height: getHeight(180),
                                        width: AppSizes.width * 0.7,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              getWidth(12)),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                details.item.image[index],
                                              ),
                                              fit: BoxFit.fill),
                                        ),
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
                        Get.to(() => ChatInboxScreen(
                              user2ndId: details.user.id,
                              profileImage: details.user.profileImage ?? "",
                              userName: details.user.fullName,
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
                          if (details.status == "delivered") ...[
                            HorizontalSpace(width: getWidth(10)),
                            CustomText(text: "Chat")
                          ],
                        ],
                      )),
                ),
                HorizontalSpace(width: getWidth(16)),
                if (details.status == "pending" ||
                    details.status != "delivered") ...[
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: CustomButton(
                              isPrimary: false,
                              borderColor: AppColors.error,
                              onPressed: () {
                                bookingConfirmController
                                    .cancelBooking(widget.bookingId)
                                    .then((onValue) {
                                  myTripController.getMyBookingAsTraveller(
                                      widget.bookingId);
                                });
                              },
                              child: Icon(
                                Icons.close,
                                color: AppColors.error,
                              )),
                        ),
                        HorizontalSpace(width: getWidth(16)),
                        Expanded(
                          flex: 2,
                          child: CustomButton(
                              isPrimary: false,
                              borderColor: AppColors.success,
                              onPressed: () {
                                bookingConfirmController
                                    .acceptBooking(widget.bookingId)
                                    .then((onValue) {
                                  myTripController.getMyBookingAsTraveller(
                                      widget.bookingId);
                                });
                              },
                              child: Icon(
                                Icons.check,
                                color: AppColors.success,
                              )),
                        )
                      ],
                    ),
                  )
                ] else if (details.status != "delivered") ...[
                  Expanded(
                    flex: 4,
                    child: CustomButton(
                        isPrimary: true,
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return QrScannerDialog(
                                  status: details.status,
                                );
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
              ],
            ),
          ),
        );
      }
    });
  }
}
