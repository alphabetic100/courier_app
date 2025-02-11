import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/item.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/icon_path.dart';
import 'package:flutter/material.dart';

class ItemCardTwo extends StatelessWidget {
  const ItemCardTwo({
    super.key,
    required this.item,
  });
  final Item item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizes.width,
      decoration: BoxDecoration(
          color: Color(0xffFFFFFF),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: item.isSelected
                  ? AppColors.primaryColor
                  : AppColors.grey.withOpacity(0.5))),
      child: Center(
        child: ListTile(
          title: CustomText(
            text: item.name,
            fontSize: getWidth(16),
            fontWeight: FontWeight.w700,
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
          subtitle: CustomText(
            text: "(${item.weight})",
            fontWeight: FontWeight.normal,
            fontSize: getWidth(14),
          ),
          trailing: Image.asset(
            IconPath.moreIcon,
            height: getHeight(24),
            width: getWidth(24),
          ),
        ),
      ),
    );
  }
}
