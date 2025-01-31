import 'package:courierapp/core/common/widgets/body_profile_card.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/trip_details_view.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/icon_path.dart';
import 'package:courierapp/core/utils/constants/image_path.dart';
import 'package:courierapp/features/profile/presentation/screens/traveller_information.dart';
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
          GestureDetector(
            onTap: () {
              //TODO: Navigate to the Traveller Information page
              Get.to(() => TravellerInformation());
            },
            child: BodyProfileCard(
              isVerified: true,
              profileImage: ImagePath.profile,
              profileName: "Albert Flores",
              rattings: "4.8/5",
              suffixIcon: Icon(
                CupertinoIcons.forward,
                size: getHeight(30),
                color: AppColors.black,
                weight: 2,
              ),
            ),
          ),
          VerticalSpace(height: getHeight(10)),
          TripDetailsView(
              tripTransport: "Buss",
              availabileSpace: "12kg",
              date: "14 Jan 2025",
              tripAdvantate: [
                "Will pickup the items from the sender's location.",
                "Will deliver directly to recipient’s door."
              ],
              tripRules: [
                "No perishable food items without proper packaging.",
                "No fragile items unless securely packaged.",
              ],
              transportIcon: IconPath.directionsBus,
              color: Colors.green),
          VerticalSpace(height: getHeight(10))
        ],
      ),
    );
  }
}

Widget builtDetail({
  required bool isSub,
  required String title,
  required Widget icon,
  String? subtitle,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(height: getHeight(23), child: icon),
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
