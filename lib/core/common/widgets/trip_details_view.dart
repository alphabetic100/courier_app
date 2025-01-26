import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/icon_path.dart';
import 'package:flutter/material.dart';

class TripDetailsView extends StatelessWidget {
  const TripDetailsView(
      {super.key,
      required this.tripTransport,
      required this.availabileSpace,
      required this.tripRules,
      required this.transportIcon,
      required this.color});
  final String transportIcon;
  final String tripTransport;
  final String availabileSpace;
  final Color color;
  final List<String> tripRules;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSizes.width,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                height: getHeight(25),
                width: getWidth(20),
                child: Image.asset(
                  transportIcon,
                  fit: BoxFit.fill,
                  color: AppColors.secondaryColor,
                ),
              ),
              HorizontalSpace(width: getHeight(16)),
              CustomText(
                text: "Transport: ",
                fontWeight: FontWeight.normal,
              ),
              CustomText(
                text: tripTransport,
                fontWeight: FontWeight.normal,
              ),
              Expanded(child: SizedBox())
            ],
          ),
          VerticalSpace(height: getHeight(10)),
          Row(
            children: [
              SizedBox(
                height: getHeight(25),
                width: getWidth(20),
                child: Image.asset(
                  IconPath.weightIcon,
                  fit: BoxFit.fill,
                  color: AppColors.secondaryColor,
                ),
              ),
              HorizontalSpace(width: getHeight(16)),
              CustomText(
                text: "Available: ",
                fontWeight: FontWeight.normal,
              ),
              CustomText(
                text: availabileSpace,
                fontWeight: FontWeight.normal,
              ),
              Expanded(child: SizedBox())
            ],
          ),
          VerticalSpace(height: getHeight(10)),
          if (tripRules.isNotEmpty)
            ...List.generate(tripRules.length, (index) {
              return Row(
                children: [
                  SizedBox(
                      height: getHeight(35),
                      width: getWidth(30),
                      child: Icon(
                        Icons.error_outline,
                        color: AppColors.error,
                      )),
                  HorizontalSpace(width: getHeight(8)),
                  Expanded(
                      child: CustomText(
                    text: tripRules[index],
                    fontWeight: FontWeight.normal,
                  ))
                ],
              );
            })
        ],
      ),
    );
  }
}
