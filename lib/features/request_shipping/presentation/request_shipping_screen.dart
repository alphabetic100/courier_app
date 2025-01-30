import 'package:courierapp/core/common/widgets/custom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_bottom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/item_card.dart';
import 'package:courierapp/core/common/widgets/message_notification_box.dart';
import 'package:courierapp/core/common/widgets/trip_details_top_body.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/features/request_shipping/controller/request_shipping_controller.dart';
import 'package:courierapp/features/request_shipping/presentation/payment_select_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestShippingScreen extends StatelessWidget {
  RequestShippingScreen({super.key});
  final RequestShippingController requestShippingController =
      Get.put(RequestShippingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: getWidth(16),
            ),
            child: MessageNotificationBox(),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TripDetailsTopBody(title: "Request shipping"),
              VerticalSpace(height: getHeight(20)),
              Obx(() => ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: requestShippingController.items.length,
                    itemBuilder: (context, index) {
                      final item = requestShippingController.items[index];
                      return Padding(
                        padding: EdgeInsets.only(bottom: getHeight(20)),
                        child: GestureDetector(
                          onTap: () {
                            requestShippingController.toggleSelection(index);
                          },
                          child: ItemCard(item: item),
                        ),
                      );
                    },
                  )),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(
        onTap: () {
          Get.to(() => PaymentSelectScreen());
        },
        secondaryWidget: Row(
          children: [
            Icon(
              CupertinoIcons.cube_box,
              color: AppColors.secondaryColor,
            ),
            HorizontalSpace(width: getWidth(10)),
            Expanded(
              child: CustomText(
                text:
                    "Your shipment will be confirmed once the traveller accepts the request.",
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        isPrimaryButton: false,
        primaryWidget: Row(
          children: [
            Expanded(
              child: CustomButton(
                  isPrimary: false,
                  onPressed: () {},
                  child: CustomText(
                    fontWeight: FontWeight.w600,
                    text: "Add Another",
                  )),
            ),
            HorizontalSpace(width: getWidth(16)),
            Expanded(
              child: CustomButton(
                  isPrimary: true,
                  onPressed: () {
                    Get.to(() => PaymentSelectScreen());
                  },
                  child: CustomText(
                    text: "Next",
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
