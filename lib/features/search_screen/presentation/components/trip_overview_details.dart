import 'package:courierapp/core/common/widgets/body_profile_card.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/trip_details_view.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/features/profile/presentation/screens/others_profile_screen.dart';
import 'package:courierapp/features/search_screen/controller/trip_overview_controller.dart';
import 'package:courierapp/features/search_screen/models/all_trip_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TripOverviewDetails extends StatelessWidget {
  TripOverviewDetails({super.key, required this.trip});
  final TripOverviewController tripOverviewController =
      Get.find<TripOverviewController>();
  final TransportData trip;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizes.width,
      padding: EdgeInsets.only(top: getHeight(12)),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              //TODO: Navigate to the Traveller Information page
              Get.to(() => OthersProfileScreen());
            },
            child: BodyProfileCard(
              isVerified: trip.user.isVerified,
              profileImage: trip.user.profileImage,
              profileName: trip.user.fullName,
              rattings: trip.user.averageRating.toString(),
              suffixIcon: Icon(
                CupertinoIcons.forward,
                size: getHeight(30),
                color: Color(0xff82918F),
                weight: 2,
              ),
            ),
          ),
          VerticalSpace(height: getHeight(10)),
          TripDetailsView(
            tripTransport: trip.transportType,
            availabileSpace: trip.weight,
            tripAdvantate: trip.additional,
            tripRules: trip.rules,
            carNumber: trip.transportNumber,
          ),
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
