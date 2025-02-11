import 'dart:io';

import 'package:courierapp/core/common/widgets/custom_button.dart';
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
                        width: getWidth(85),
                        child: Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(1),
                              child: DottedBorder(
                                color: Colors.grey,
                                radius: Radius.circular(12),
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
        VerticalSpace(height: 10),
        CustomButton(
            height: getHeight(55),
            isPrimary: false,
            onPressed: () {},
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
                child: Obx(
                  () => DropdownButton<String>(
                    isDense: true,
                    isExpanded: true,
                    underline: SizedBox.shrink(),
                    padding: EdgeInsets.zero,
                    elevation: 0,
                    value: shippingController.itemWeight.value,
                    onChanged: (value) {
                      shippingController.itemWeight.value = value!;
                    },
                    items: ['5kg', '7kg', '10kg', '12kg', '15kg']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: CustomText(
                          text: value,
                          color: AppColors.black,
                          fontSize: getWidth(15),
                        ),
                      );
                    }).toList(),
                  ),
                )))
      ],
    );
  }
}
