import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/icon_path.dart';
import 'package:courierapp/features/search_screen/controller/trip_overview_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TripOverviewDetails extends StatelessWidget {
  TripOverviewDetails({super.key});
  final TripOverviewController tripOverviewController =
      Get.find<TripOverviewController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizes.width,
      padding: EdgeInsets.only(top: getHeight(16)),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.all(0),
            leading: Stack(
              children: [
                CircleAvatar(),
                tripOverviewController.isVerified.value
                    ? Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          backgroundColor: AppColors.secondaryColor,
                          radius: getWidth(10),
                          child: Icon(
                            Icons.check,
                            size: getHeight(15),
                            color: Colors.white,
                          ),
                        ),
                      )
                    : SizedBox.shrink(),
              ],
            ),
            title: CustomText(
              text: "Albert Flores",
              color: AppColors.black,
            ),
            subtitle: Row(
              children: [
                Icon(Icons.star_rounded, color: Color(0xFFFFC934)),
                Text("4.8/5"),
              ],
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.forward,
                size: getHeight(30),
                color: AppColors.black,
                weight: 2,
              ),
            ),
          ),
          VerticalSpace(height: getHeight(10)),
          _builtDetail(
              isSub: true,
              title: "Transport:",
              icon: Image.asset(
                IconPath.directionsBus,
                height: getHeight(25),
                fit: BoxFit.cover,
                color: AppColors.secondaryColor,
              ),
              subtitle: "Bus"),
          VerticalSpace(height: getHeight(10)),
          _builtDetail(
              isSub: true,
              title: "Available:",
              icon: Image.asset(
                IconPath.weightIcon,
                height: getHeight(25),
                fit: BoxFit.cover,
                color: AppColors.secondaryColor,
              ),
              subtitle: "5kg"),
          VerticalSpace(height: getHeight(10)),
          _builtDetail(
            isSub: false,
            title: "No perishable food items without proper packaging.",
            icon: Icon(
              Icons.error_outline,
              color: Colors.red,
            ),
          ),
          VerticalSpace(height: getHeight(10)),
          _builtDetail(
            isSub: false,
            title: "No fragile items unless securely packaged.",
            icon: Icon(
              Icons.error_outline,
              color: Colors.red,
            ),
          ),
          VerticalSpace(height: getHeight(10)),
        ],
      ),
    );
  }
}

Widget _builtDetail({
  required bool isSub,
  required String title,
  required Widget icon,
  String? subtitle,
}) {
  return Row(
    children: [
      icon,
      HorizontalSpace(width: getWidth(10)),
      isSub
          ? CustomText(
              text: title,
              fontSize: getWidth(18),
              fontWeight: FontWeight.normal,
            )
          : Expanded(
              child: CustomText(
              text: title,
              fontSize: getWidth(18),
              fontWeight: FontWeight.normal,
            )),
      HorizontalSpace(width: getWidth(10)),
      CustomText(
        text: subtitle ?? "",
        fontSize: getWidth(18),
        fontWeight: FontWeight.normal,
      ),
    ],
  );
}
