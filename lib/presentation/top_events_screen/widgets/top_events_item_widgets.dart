import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mixpanelapp/core/app_export.dart';
import 'package:mixpanelapp/data/apiClient/notification_api.dart';
import 'package:mixpanelapp/presentation/top_events_screen/controller/top_events_controller.dart';
import 'package:mixpanelapp/presentation/top_events_screen/models/top_events_item_model.dart';
import 'package:mixpanelapp/presentation/top_events_screen/models/top_events_model.dart';

class TopEventsItemWidgets extends StatelessWidget {
  TopEventsItemWidgets(this.topEventsItemModelObj);

  TopEventsItemModel topEventsItemModelObj;

  var controller = Get.find<TopEventsController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onEventPressed();
      },
      child: Padding(
        padding: getPadding(top: 20, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: getPadding(top: 1),
              child: Text(
                topEventsItemModelObj.eventNameTxt.value,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtApercuMedium16.copyWith(),
              ),
            ),
            Padding(
              padding: getPadding(top: 1, right: 10),
              child: CommonImageView(
                svgPath: ImageConstant.imgArrowright,
                height: getVerticalSize(12.00),
                width: getHorizontalSize(11.00),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onEventPressed() {
    Get.find<PrefUtils>()
        .setEventName(topEventsItemModelObj.eventNameTxt.value);
    Get.toNamed(AppRoutes.categoryTypeScreen);
  }
}
