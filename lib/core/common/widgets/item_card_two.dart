import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/image_path.dart';
import 'package:courierapp/features/search_screen/controller/item_controller.dart';
import 'package:courierapp/features/search_screen/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemCardTwo extends StatelessWidget {
  ItemCardTwo({
    super.key,
    required this.item,
    required this.isSelected,
  });
  final ItemData item;
  final bool isSelected;
  final ItemController itemController = Get.put(ItemController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizes.width,
      padding: EdgeInsets.all(getWidth(8)),
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isSelected
              ? AppColors.primaryColor
              : AppColors.grey.withOpacity(0.5),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: item.image.isEmpty
                ? SizedBox(
                    height: getHeight(70),
                    width: getWidth(60),
                    child: Image.asset(
                      ImagePath.noImage,
                      fit: BoxFit.fill,
                    ),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(getWidth(8)),
                    child: SizedBox(
                      height: getHeight(70),
                      width: getWidth(60),
                      child: Image.network(
                        item.image[0],
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
          ),
          HorizontalSpace(width: getWidth(8)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: item.name,
                  fontSize: getWidth(16),
                  fontWeight: FontWeight.w700,
                  color: AppColors.titleTextColor,
                ),
                SizedBox(height: getHeight(5)),
                CustomText(
                  text: "(${item.weight}kg)",
                  fontWeight: FontWeight.normal,
                  fontSize: getWidth(14),
                ),
              ],
            ),
          ),

          // Popup Menu (Trailing)
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                onTap: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.edit,
                      color: AppColors.secondaryColor,
                      size: getWidth(20),
                    ),
                    HorizontalSpace(width: getWidth(5)),
                    CustomText(
                      text: "Edit",
                      color: AppColors.secondaryColor,
                      fontSize: getWidth(12),
                      fontWeight: FontWeight.normal,
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                onTap: () {
                  itemController.deleteItem(item.id);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.delete,
                      color: AppColors.error,
                      size: getWidth(20),
                    ),
                    HorizontalSpace(width: getWidth(5)),
                    CustomText(
                      text: "Delete",
                      fontSize: getWidth(12),
                      fontWeight: FontWeight.normal,
                      color: AppColors.error,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
