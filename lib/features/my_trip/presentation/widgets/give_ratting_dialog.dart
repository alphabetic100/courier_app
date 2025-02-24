import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/custom_text_form_field.dart';
import 'package:courierapp/core/common/widgets/error_snakbar.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/icon_path.dart';
import 'package:courierapp/features/my_trip/controller/ratting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GiveRatingDialog extends StatelessWidget {
  GiveRatingDialog({super.key, required this.bookingID});
  final String bookingID;
  final RattingController rattingController = Get.put(RattingController());
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            IconPath.worningIcon,
            height: getHeight(70),
          ),
          SizedBox(height: getHeight(10)), // Fixed spacing
          CustomText(
            text: "Give your honest feedback",
            fontSize: getWidth(24),
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
          const SizedBox(height: 16),
          CustomText(
            text: "How was the traveller?",
            fontSize: getWidth(14),
            fontWeight: FontWeight.normal,
            color: AppColors.grey,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(
              5,
              (index) => Padding(
                padding: EdgeInsets.only(right: getHeight(8)),
                child: GestureDetector(
                  onTap: () {
                    rattingController.updateRating(index);
                  },
                  child: Obx(
                    () => Icon(
                      Icons.star,
                      color: rattingController.selectedIndex.value > index
                          ? Colors.amber
                          : Colors.grey,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          CustomText(
            text: "Leave a comment",
            fontSize: getWidth(14),
            fontWeight: FontWeight.normal,
            color: AppColors.grey,
          ),
          const SizedBox(height: 10),
          CustomTexFormField(
            controller: rattingController.feedBackComment,
            hintText: "e.g. Thank you so much",
            maxLines: 3,
          )
        ],
      ),
      actions: [
        CustomButton(
          onPressed: () {
            if (rattingController.feedBackComment.text.isEmpty ||
                rattingController.selectedIndex.value < 0) {
              errorSnakbar(
                  errorMessage: "Please provide both a comment and a rating.");
              return;
            } else {
              Get.back();
              rattingController.giveReview(bookingID);
            }
          },
          child: CustomText(
            text: "Submit",
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}
