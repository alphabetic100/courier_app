import 'package:courierapp/core/common/widgets/body_profile_card.dart';
import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/features/my_trip/controller/booking_confirm_controller.dart';
import 'package:courierapp/features/my_trip/models/single_travel_model.dart';
import 'package:courierapp/features/my_trip/presentation/widgets/sender_request_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SenderRequestCard extends StatelessWidget {
  SenderRequestCard({super.key, required this.bookings});
  final List<Booking> bookings;
  final BookingConfirmController bookingConfirmController =
      Get.put(BookingConfirmController());
  @override
  Widget build(BuildContext context) {
    if (bookings.isEmpty) {
      return SizedBox.shrink();
    } else {
      return ListView.builder(
          itemCount: bookings.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final request = bookings[index];
            return Padding(
              padding: EdgeInsets.only(bottom: getHeight(20)),
              child: GestureDetector(
                onTap: () {
                  Get.to(() => SenderRequestDetailsScreen(
                        bookingId: request.bookingId,
                      ));
                },
                child: Container(
                  padding: EdgeInsets.all(getWidth(16)),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border:
                          Border.all(color: AppColors.grey.withOpacity(0.5))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BodyProfileCard(
                          isVerified: request.isVerified,
                          profileImage: request.profileImage,
                          profileName: request.fullName,
                          subtitle: "Total ${request.totalTrips} Trips",
                          rattings: request.avgRating.toString(),
                          suffixIcon: CustomText(
                            text: "\$${request.price}",
                            color: AppColors.titleTextColor,
                            fontSize: getWidth(24),
                            fontWeight: FontWeight.bold,
                          )),
                      VerticalSpace(height: getHeight(10)),
                      Divider(
                        color: AppColors.grey,
                      ),
                      VerticalSpace(height: getHeight(10)),
                      CustomText(
                        text: "${request.itemName} (${request.itemWeight}kg)",
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                        fontSize: getWidth(15),
                      ),
                      VerticalSpace(height: getHeight(10)),
                      CustomText(
                        text: request.message,
                        fontWeight: FontWeight.normal,
                        color: AppColors.bodyTextColor,
                        fontSize: getWidth(15),
                      ),
                      VerticalSpace(height: getHeight(10)),
                      Row(
                        children: [
                          CustomText(
                            text: "Status: ",
                            color: AppColors.titleTextColor,
                            fontWeight: FontWeight.w700,
                          ),
                          HorizontalSpace(width: getWidth(5)),
                          CustomText(
                            text: request.status == "pending"
                                ? "Pending Confirmation"
                                : request.status == "accepted"
                                    ? "Ready for pickup."
                                    : request.status == "pickupped"
                                        ? "Picked up"
                                        : request.status,
                            color: request.status == "pending"
                                ? AppColors.warning
                                : AppColors.secondaryColor,
                            fontWeight: FontWeight.normal,
                          ),
                        ],
                      ),
                      VerticalSpace(height: getHeight(10)),
                      if (request.status == "pending") ...[
                        Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                  isPrimary: false,
                                  borderColor: AppColors.success,
                                  onPressed: () {
                                    bookingConfirmController
                                        .acceptBooking(request.bookingId);
                                  },
                                  child: Icon(
                                    Icons.check,
                                    color: AppColors.success,
                                  )),
                            ),
                            HorizontalSpace(width: getWidth(10)),
                            Expanded(
                              child: CustomButton(
                                  isPrimary: false,
                                  onPressed: () {
                                    bookingConfirmController
                                        .cancelBooking(request.bookingId);
                                  },
                                  borderColor: AppColors.error,
                                  child: Icon(
                                    Icons.close,
                                    color: AppColors.error,
                                  )),
                            ),
                          ],
                        ),
                      ],
                      VerticalSpace(height: getHeight(10)),
                    ],
                  ),
                ),
              ),
            );
          });
    }
  }
}
