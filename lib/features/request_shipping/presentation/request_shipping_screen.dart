import 'package:courierapp/core/common/widgets/custom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_bottom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/custom_text_form_field.dart';
import 'package:courierapp/core/common/widgets/item_card_two.dart';
import 'package:courierapp/core/common/widgets/message_notification_box.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/helpers/app_helper.dart';
import 'package:courierapp/features/request_shipping/components/request_shiping_top_body.dart';
import 'package:courierapp/features/request_shipping/controller/request_shipping_controller.dart';
import 'package:courierapp/features/request_shipping/presentation/payment_method_screen.dart';
import 'package:courierapp/features/request_shipping/presentation/payment_select_screen.dart';
import 'package:courierapp/features/search_screen/controller/item_controller.dart';
import 'package:courierapp/features/search_screen/models/all_trip_model.dart';
import 'package:courierapp/features/search_screen/presentation/screens/add_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestShippingScreen extends StatelessWidget {
  RequestShippingScreen({super.key, required this.trip});
  final RequestShippingController requestShippingController =
      Get.put(RequestShippingController());
  final ItemController itemController = Get.put(ItemController());
  final TransportData trip;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: Color(0xffFAFAFC),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RequestShippingTopBody(
              title: "Request shipping",
              departingFrom: trip.from,
              arrivingTo: trip.to,
              price: trip.price.toString(),
              date: AppHelperFunctions.formateDate(trip.date),
            ),
            VerticalSpace(height: getHeight(20)),
            Obx(() => ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: itemController.myItems.value!.data.length,
                  itemBuilder: (context, index) {
                    final item = itemController.myItems.value!.data[index];
                    return Padding(
                      padding: EdgeInsets.only(bottom: getHeight(20)),
                      child: GestureDetector(
                        onTap: () {
                          requestShippingController.toggleSelection(index);
                        },
                        child: Obx(
                          () => Padding(
                            padding: EdgeInsets.only(
                                left: getWidth(16), right: getWidth(16)),
                            child: ItemCardTwo(
                              isdeletable: requestShippingController
                                      .selectedItems
                                      .contains(index)
                                  ? false
                                  : true,
                              item: item,
                              isSelected: requestShippingController
                                  .selectedItems
                                  .contains(index),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )),
            Padding(
              padding: EdgeInsets.only(left: getWidth(16), right: getWidth(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Message",
                    fontSize: getWidth(16),
                    fontWeight: FontWeight.w600,
                    color: Color(0xff262B2B),
                  ),
                  SizedBox(
                    height: getHeight(8),
                  ),
                  CustomTexFormField(
                    hintText: "Message for your traveller ",
                    maxLines: 4,
                  )
                ],
              ),
            )
          ],
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
                  onPressed: () {
                    Get.to(() => AddItem());
                  },
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
                    Get.to(() => PaymentMethodScreen(
                          trip: trip,
                        ));
                  },
                  child: CustomText(
                    text: "Next",
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
