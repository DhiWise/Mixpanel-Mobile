import '../controller/all_events_controller.dart';
import '../models/listcalendar_item_model.dart';
import 'package:flutter/material.dart';
import 'package:mixpanelapp/core/app_export.dart';

// ignore: must_be_immutable
class ListcalendarItemWidget extends StatelessWidget {
  ListcalendarItemWidget(this.listcalendarItemModelObj,);

  ListCalendarItemModel listcalendarItemModelObj;

  var controller = Get.find<AllEventsController>();


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTapBackButton();
      },
      child: Padding(
        padding: getPadding(
          top: 25.0,
          bottom: 25.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CommonImageView(
                  svgPath: ImageConstant.imgCalendar,
                  height: getVerticalSize(
                    22.00,
                  ),
                  width: getHorizontalSize(
                    20.00,
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 20,
                    top: 3,
                    bottom: 2,
                  ),
                  child: Obx( ()=>
                      Text(
                      listcalendarItemModelObj.eventDateTxt.value,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtApercuMedium16.copyWith(),
                    ),
                  ),
                ),
              ],
            ),
            Obx(
              () => Padding(
                padding: getPadding(right: 10.00),
                child: Text(
                  num.tryParse(listcalendarItemModelObj.totalCountTxt.value)?.toStringAsFixed(2) ?? '0',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtApercuMedium16.copyWith(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  onTapBackButton() {
    Get.toNamed(AppRoutes.reminderScreen);
  }
}
