import '../all_events_screen/widgets/listcalendar_item_widget.dart';
import 'controller/all_events_controller.dart';
import 'models/listcalendar_item_model.dart';
import 'package:flutter/material.dart';
import 'package:mixpanelapp/core/app_export.dart';

class AllEventsScreen extends GetWidget<AllEventsController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body: Container(
          width: size.width,
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: size.width,
                      decoration:
                          BoxDecoration(color: ColorConstant.indigoA200),
                      child: Padding(
                        padding: getPadding(right: 164),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            GestureDetector(
                              onTap: () {
                                onTapBackButton();
                              },
                              child: Container(
                                padding: getPadding(all: 28),
                                child: CommonImageView(
                                  svgPath: ImageConstant.imgArrowleft,
                                  height: getVerticalSize(15.00),
                                  width: getHorizontalSize(
                                    15.00,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "lbl_event_data".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtApercuBold20.copyWith(),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 18,
                      top: 10,
                      right: 16,
                      bottom: 256,
                    ),
                    child: Obx(
                      () => ListView.separated(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          return Container(
                              height: getVerticalSize(1.00),
                              width: getHorizontalSize(396.00),
                              decoration:
                                  BoxDecoration(color: ColorConstant.indigo50));
                        },
                        itemCount: controller.allEventsModelObj.value
                            .listcalendarItemList.length,
                        itemBuilder: (context, index) {
                          ListCalendarItemModel model = controller
                              .allEventsModelObj
                              .value
                              .listcalendarItemList[index];
                          return ListcalendarItemWidget(model);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  onTapBackButton() {
    Get.back();
  }
}
