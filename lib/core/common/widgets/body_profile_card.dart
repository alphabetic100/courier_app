import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/image_path.dart';
import 'package:flutter/material.dart';

class BodyProfileCard extends StatelessWidget {
  const BodyProfileCard(
      {super.key,
      required this.isVerified,
      required this.profileImage,
      required this.profileName,
      this.rattings = "",
      this.subtitle = "",
      required this.suffixIcon,
      this.carNumber = ""});
  final bool isVerified;
  final String profileImage;
  final String profileName;
  final String rattings;
  final Widget suffixIcon;
  final String subtitle;
  final String carNumber;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: Stack(
        children: [
          CircleAvatar(
            backgroundImage: profileImage.isNotEmpty
                ? NetworkImage(profileImage)
                : AssetImage(ImagePath.profile),
          ),
          isVerified
              ? Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    backgroundColor: Color(0xFF2BCD31),
                    radius: getWidth(8),
                    child: Icon(
                      Icons.check,
                      size: getHeight(10),
                      color: Colors.white,
                    ),
                  ),
                )
              : SizedBox.shrink(),
        ],
      ),
      title: SizedBox(
        width: AppSizes.width * 0.5,
        child: CustomText(
          text: profileName,
          color: AppColors.black,
          textOverflow: TextOverflow.ellipsis,
        ),
      ),
      subtitle: Row(
        children: [
          if (rattings.isNotEmpty) ...[
            Icon(Icons.star_rounded, color: Color(0xFFFFC934)),
            CustomText(
              text: "${double.parse(rattings).toStringAsFixed(1)}/5",
              color: AppColors.black,
              fontSize: getWidth(14),
              fontWeight: FontWeight.normal,
            )
          ],
          if (subtitle.isNotEmpty) ...[
            Expanded(
              child: CustomText(
                text: subtitle,
                fontSize: getWidth(15),
                fontWeight: FontWeight.normal,
              ),
            )
          ]
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (carNumber.isNotEmpty) ...[
            Container(
              alignment: Alignment.centerRight,
              width: AppSizes.width * 0.2,
              child: CustomText(
                text: carNumber,
                textOverflow: TextOverflow.ellipsis,
                fontSize: getWidth(14),
                fontWeight: FontWeight.normal,
              ),
            ),
            HorizontalSpace(width: getWidth(15)),
          ],
          suffixIcon,
        ],
      ),
    );
  }
}
