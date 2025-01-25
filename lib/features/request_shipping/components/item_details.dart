import 'dart:io';

import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/custom_text_form_field.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/features/request_shipping/controller/request_shipping_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemDetails extends StatelessWidget {
  ItemDetails({super.key});
  final RequestShippingController shippingController =
      Get.find<RequestShippingController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "Item Name",
          color: AppColors.black,
        ),
        VerticalSpace(height: getHeight(10)),
        CustomTexFormField(hintText: "Enter your item name"),
        VerticalSpace(height: getHeight(20)),
        CustomText(
          text: "Item Description",
          color: AppColors.black,
        ),
        VerticalSpace(height: getHeight(10)),
        CustomTexFormField(
          hintText: 'Enter a short description of your item',
          maxLines: 3,
        ),
        VerticalSpace(height: getHeight(20)),
        CustomText(
          text: "Item Weight",
          color: AppColors.black,
        ),
        Row(
          children: [
            Obx(() => CustomText(
                text:
                    "${shippingController.itemWeight.value.toStringAsFixed(1)} kg")),
            Expanded(
              child: Obx(
                () => Slider(
                  activeColor: AppColors.secondaryColor,
                  value: shippingController.itemWeight.value,
                  min: 0.5,
                  max: 5.0,
                  divisions: 18,
                  onChanged: (value) {
                    shippingController.itemWeight.value = value;
                  },
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.0),
        CustomText(
          text: "Attach Some photos of your item",
          color: AppColors.black,
        ),
        VerticalSpace(height: getHeight(15)),
        Obx(
          () => GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
            ),
            itemCount: shippingController.selectedImages.length + 1,
            itemBuilder: (context, index) {
              if (index < shippingController.selectedImages.length) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: FileImage(
                        File(shippingController.selectedImages[index].path),
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              } else {
                return GestureDetector(
                  onTap: () => shippingController.pickImage(),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.grey),
                      color: Colors.grey[200],
                    ),
                    child: Icon(
                      Icons.add_a_photo,
                      color: AppColors.grey,
                    ),
                  ),
                );
              }
            },
          ),
        )
      ],
    );
  }
}
