import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/item.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/icon_path.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.item,
  });
  final Item item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizes.width,
      decoration: BoxDecoration(
          color:
              item.isSelected ? AppColors.primaryColor.withOpacity(0.2) : null,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color:
                  item.isSelected ? AppColors.primaryColor : AppColors.grey)),
      child: Center(
        child: ListTile(
          title: CustomText(
            text: item.name,
            fontSize: getWidth(16),
            fontWeight: FontWeight.w600,
            color: AppColors.titleTextColor,
          ),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                item.imagePath,
                height: getHeight(55),
                fit: BoxFit.contain,
              ),
            ),
          ),
          subtitle: Row(
            children: [
              CustomText(
                text: item.from,
                fontWeight: FontWeight.normal,
                fontSize: getWidth(14),
              ),
              HorizontalSpace(width: getWidth(5)),
              Image.asset(
                IconPath.arrow,
                width: getWidth(30),
                color: AppColors.grey,
                fit: BoxFit.fill,
              ),
              HorizontalSpace(width: getWidth(5)),
              CustomText(
                text: item.destination,
                fontWeight: FontWeight.normal,
                fontSize: getWidth(14),
              ),
              HorizontalSpace(width: getWidth(5)),
              SizedBox(
                height: getHeight(20),
                child: VerticalDivider(
                  color: AppColors.grey,
                ),
              ),
              HorizontalSpace(width: getWidth(5)),
              CustomText(
                text: "(${item.weight})",
                fontWeight: FontWeight.normal,
                fontSize: getWidth(14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
