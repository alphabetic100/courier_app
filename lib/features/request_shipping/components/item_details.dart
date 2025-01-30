import 'dart:io';

import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/custom_text_form_field.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/features/request_shipping/controller/request_shipping_controller.dart';
import 'package:dotted_border/dotted_border.dart';
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

        SizedBox(height: 16.0),
        CustomText(
          text: "Attach Some photos of your item",
          color: AppColors.black,
        ),
        VerticalSpace(height: getHeight(15)),

// UI part
        SizedBox(
          height: getHeight(80),
          width: AppSizes.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: getWidth(15)),
                child: Obx(() => GestureDetector(
                      onTap: () => shippingController.pickImage(index),
                      child: SizedBox(
                        width: getWidth(80),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: DottedBorder(
                                radius: Radius.circular(8),
                                child: Center(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: shippingController
                                              .selectedImages[index].isEmpty
                                          ? Colors.grey[200]
                                          : null,
                                      image: shippingController
                                              .selectedImages[index].isNotEmpty
                                          ? DecorationImage(
                                              image: FileImage(
                                                File(shippingController
                                                    .selectedImages[index]),
                                              ),
                                              fit: BoxFit.cover,
                                            )
                                          : null,
                                    ),
                                    child: shippingController
                                            .selectedImages[index].isEmpty
                                        ? Icon(Icons.add_a_photo,
                                            color: AppColors.grey)
                                        : null,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
              );
            },
          ),
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
                  activeColor: AppColors.primaryColor,
                  value: shippingController.itemWeight.value,
                  min: 0.5,
                  max: 100,
                  // divisions: 18,
                  onChanged: (value) {
                    shippingController.itemWeight.value = value;
                  },
                ),
              ),
            ),
            CustomText(text: "100kg")
          ],
        ),
      ],
    );
  }
}
