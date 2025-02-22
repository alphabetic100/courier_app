import 'package:courierapp/core/common/styles/get_text_style.dart';
import 'package:courierapp/core/common/widgets/body_profile_card.dart';
import 'package:courierapp/core/common/widgets/custom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_bottom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/message_notification_box.dart';
import 'package:courierapp/core/common/widgets/progress_indicator.dart';
import 'package:courierapp/core/common/widgets/trip_details_top_body.dart';
import 'package:courierapp/core/services/Auth_service.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/icon_path.dart';
import 'package:courierapp/core/utils/constants/image_path.dart';
import 'package:courierapp/core/utils/helpers/app_helper.dart';
import 'package:courierapp/features/messege/presentation/components/view_Image_screen.dart';
import 'package:courierapp/features/messege/presentation/screens/chat_screens.dart';
import 'package:courierapp/features/my_trip/controller/delivery_details_controller.dart';
import 'package:courierapp/features/my_trip/presentation/widgets/qr_generate_dialog.dart';
import 'package:courierapp/features/profile/presentation/screens/traveller_profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryDetailsScreen extends StatefulWidget {
  const DeliveryDetailsScreen({
    super.key,
    required this.bookingID,
  });
  final String bookingID;

  @override
  State<DeliveryDetailsScreen> createState() => _DeliveryDetailsScreenState();
}

class _DeliveryDetailsScreenState extends State<DeliveryDetailsScreen> {
  final DeliveryDetailsController deliveryDetailsController =
      Get.put(DeliveryDetailsController());
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 200), () {
      deliveryDetailsController.getDeliveryDetails(
          widget.bookingID, AuthService.token);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (deliveryDetailsController.deliveryDetails.value == null) {
        WidgetsBinding.instance.addPostFrameCallback((callback) {
          showProgressIndicator();
        });
        return Scaffold();
      }

      if (deliveryDetailsController.deliveryDetails.value != null) {
        hideProgressIndicator();
        final detail = deliveryDetailsController.deliveryDetails.value!.data[0];
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
                  departingFrom: detail.transportFrom,
                  arrivingTo: detail.transportTo,
                  price: detail.price.toString(),
                  date: AppHelperFunctions.formateDate(detail.transportDate),
                  lat1: detail.lat1,
                  lon1: detail.lon1,
                  lat2: detail.lat2,
                  lon2: detail.lon2,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => TravellerProfileScreen(),
                          arguments: detail.travelerId);
                    },
                    child: BodyProfileCard(
                        isVerified: detail.isVerified,
                        profileImage: detail.profileImage,
                        profileName: detail.fullName,
                        rattings: detail.averageRating.toString(),
                        carNumber: detail.transportNumber,
                        suffixIcon: detail.transportType.toLowerCase() == "bus"
                            ? Image.asset(
                                IconPath.directionsBus,
                                height: getHeight(25),
                                color: AppColors.grey,
                              )
                            : detail.transportType.toLowerCase() == "car"
                                ? Image.asset(
                                    IconPath.car,
                                    height: getHeight(25),
                                    color: AppColors.grey,
                                  )
                                : detail.transportType.toLowerCase() ==
                                        "airplane"
                                    ? Image.asset(
                                        IconPath.plane,
                                        height: getHeight(25),
                                        color: AppColors.grey,
                                      )
                                    : detail.transportType.toLowerCase() ==
                                            "train"
                                        ? Image.asset(
                                            IconPath.train,
                                            height: getHeight(25),
                                            color: AppColors.grey,
                                          )
                                        : SizedBox.shrink()),
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
                            fontSize: getWidth(15),
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                          HorizontalSpace(width: getWidth(5)),
                          Expanded(
                            child: CustomText(
                              text: detail.itemName,
                              fontSize: getWidth(15),
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
                              fontSize: getWidth(15),
                            )),
                        TextSpan(
                            text: detail.itemDescription,
                            style: getTextStyleMsrt(
                              color: AppColors.grey,
                              fontWeight: FontWeight.w400,
                              fontSize: getWidth(15),
                            ))
                      ])),
                      Row(
                        children: [
                          CustomText(
                            text: "Status:",
                            fontSize: getWidth(15),
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                          HorizontalSpace(width: getWidth(5)),
                          Expanded(
                            child: CustomText(
                              text: detail.status,
                              fontSize: getWidth(15),
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
                VerticalSpace(height: getHeight(20)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: getHeight(180),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: detail.itemImage.isEmpty
                            ? 1
                            : detail.itemImage.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: getWidth(10)),
                            child: GestureDetector(
                              onTap: () => Get.to(() => ViewImageScreen(
                                    imageUrl: detail.itemImage.isNotEmpty
                                        ? detail.itemImage[index]
                                        : "",
                                  )),
                              child: Container(
                                height: getHeight(120),
                                width: AppSizes.width * 0.7,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(getWidth(12)),
                                  image: DecorationImage(
                                      image: detail.itemImage.isNotEmpty
                                          ? NetworkImage(
                                              detail.itemImage[index],
                                            )
                                          : AssetImage(
                                              ImagePath.noImage,
                                            ),
                                      fit: BoxFit.cover),
                                ),
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
                              user2ndId: detail.travelerId,
                              profileImage: detail.profileImage,
                              userName: detail.fullName,
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
                          if (detail.status != "pending") ...[
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
                if (detail.status == "pending") ...[
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
                                  qrHEX: detail.bookingId,
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
      return Scaffold();
    });
  }
}
