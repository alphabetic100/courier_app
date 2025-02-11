import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/features/search_screen/controller/search_screen_controller.dart';
import 'package:courierapp/features/search_screen/presentation/components/search_result_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchResultBody extends StatelessWidget {
  SearchResultBody({super.key});
  final SearchScreenController searchController =
      Get.find<SearchScreenController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: const Color(0xffFFFFFF),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
          child: Obx(() {
            final searchData = searchController.searchData.value;
            if (searchData == null) {
              return const Scaffold();
            }

            final trips = searchData.data;
            if (trips.isEmpty) {
              return const Center(
                child: CustomText(
                  text: 'No trips found',
                  fontSize: 20,
                  color: AppColors.black,
                ),
              );
            }

            return ListView.builder(
                shrinkWrap: true,
                itemCount: trips.length,
                itemBuilder: (context, index) {
                  final trip = trips[index];
                  final user = trip.user;

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: SearchResultCard(
                      from: trip.from,
                      to: trip.to,
                      price: trip.price.toString(),
                      availableSpace: trip.weight,
                      profileUrl: user.profileImage,
                      profileRetting: user.averageRating.toString(),
                      carNumber: trip.transportNumber,
                      trynasportType: trip.transportType,
                      profileName: user.fullName,
                      isVerified: user.isVerified,
                      trip: trip,
                    ),
                  );
                });
          }),
        ),
      ),
    );
  }
}
