import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/icon_path.dart';
import 'package:flutter/material.dart';

class TripDetailsView extends StatelessWidget {
  const TripDetailsView({
    super.key,
    required this.tripTransport,
    required this.availabileSpace,
    required this.tripRules,
    this.date = "",
    required this.tripAdvantate,
    this.carNumber = "",
  });

  final String tripTransport;
  final String availabileSpace;
  final String date;
  final String carNumber;
  final List<String> tripRules;
  final List<String> tripAdvantate;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSizes.width,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: getWidth(5)),
                child: SizedBox(
                  height: getHeight(25),
                  width: getWidth(20),
                  child: tripTransport.toLowerCase() == "bus"
                      ? Image.asset(
                          IconPath.directionsBus,
                          height: getHeight(25),
                          color: AppColors.secondaryColor,
                        )
                      : tripTransport.toLowerCase() == "car"
                          ? Image.asset(
                              IconPath.car,
                              height: getHeight(25),
                              color: AppColors.secondaryColor,
                            )
                          : tripTransport.toLowerCase() == "airplane"
                              ? Image.asset(
                                  IconPath.plane,
                                  height: getHeight(25),
                                  color: AppColors.secondaryColor,
                                )
                              : Image.asset(
                                  IconPath.train,
                                  height: getHeight(25),
                                  color: AppColors.secondaryColor,
                                ),
                ),
              ),
              HorizontalSpace(width: getHeight(16)),
              CustomText(
                text: "Transport: ",
                fontWeight: FontWeight.w600,
                color: AppColors.titleTextColor,
              ),
              CustomText(
                text: tripTransport,
                fontWeight: FontWeight.normal,
              ),
              if (carNumber.isNotEmpty) ...[
                HorizontalSpace(width: getWidth(3)),
                SizedBox(
                  height: getHeight(15),
                  child: VerticalDivider(
                    thickness: 2,
                    color: AppColors.grey,
                  ),
                ),
                HorizontalSpace(width: getWidth(3)),
                CustomText(
                  text: carNumber,
                  fontSize: getWidth(14),
                  fontWeight: FontWeight.normal,
                )
              ],
              Expanded(child: SizedBox())
            ],
          ),
          VerticalSpace(height: getHeight(10)),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: getWidth(5)),
                child: SizedBox(
                  height: getHeight(25),
                  width: getWidth(20),
                  child: Image.asset(
                    IconPath.weightIcon,
                    fit: BoxFit.fill,
                    color: AppColors.secondaryColor,
                  ),
                ),
              ),
              HorizontalSpace(width: getHeight(16)),
              CustomText(
                text: "Available: ",
                fontWeight: FontWeight.w600,
                color: AppColors.titleTextColor,
              ),
              CustomText(
                text: availabileSpace,
                fontWeight: FontWeight.normal,
              ),
              Expanded(child: SizedBox())
            ],
          ),
          if (date.isNotEmpty) ...[
            VerticalSpace(height: getHeight(10)),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: getWidth(5)),
                  child: SizedBox(
                      height: getHeight(25),
                      width: getWidth(20),
                      child: Icon(
                        Icons.calendar_month,
                        color: AppColors.secondaryColor,
                      )),
                ),
                HorizontalSpace(width: getHeight(16)),
                CustomText(
                  text: "Date: ",
                  fontWeight: FontWeight.w600,
                  color: AppColors.titleTextColor,
                ),
                CustomText(
                  text: date,
                  fontWeight: FontWeight.normal,
                ),
                Expanded(child: SizedBox())
              ],
            ),
          ],
          VerticalSpace(height: getHeight(10)),
          if (tripAdvantate.isNotEmpty)
            ...List.generate(tripAdvantate.length, (index) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: getHeight(35),
                    width: getWidth(30),
                    child: Icon(
                      Icons.check,
                      color: AppColors.success.withOpacity(0.7),
                    ),
                  ),
                  HorizontalSpace(width: getHeight(8)),
                  Expanded(
                    child: CustomText(
                      text: tripAdvantate[index], // Corrected reference
                      fontWeight: FontWeight.normal,
                    ),
                  )
                ],
              );
            }),
          VerticalSpace(height: getHeight(10)),
          if (tripRules.isNotEmpty)
            ...List.generate(tripRules.length, (index) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: getHeight(35),
                    width: getWidth(30),
                    child: Icon(
                      Icons.error_outline,
                      color: AppColors.error,
                    ),
                  ),
                  HorizontalSpace(width: getHeight(8)),
                  Expanded(
                    child: CustomText(
                      text: tripRules[index],
                      fontWeight: FontWeight.normal,
                    ),
                  )
                ],
              );
            }),
        ],
      ),
    );
  }
}
