import 'package:mixpanelapp/presentation/top_events_screen/models/top_events_item_model.dart';
import 'package:mixpanelapp/presentation/top_events_screen/widgets/top_events_item_widgets.dart';

import 'controller/top_events_controller.dart';
import 'package:flutter/material.dart';
import 'package:mixpanelapp/core/app_export.dart';

class TopEventsScreen extends GetWidget<TopEventsController> {
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
                      width: double.infinity,
                      decoration: AppDecoration.fillIndigoA200,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: getPadding(
                                left: 165, top: 24, right: 164, bottom: 24),
                            child: Text(
                              "lbl_top_events".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtApercuBold20.copyWith(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: getPadding(left: 16, top: 10, right: 16),
                    child: Obx(
                      () => ListView.separated(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          return Container(
                            height: getVerticalSize(1.00),
                            width: getHorizontalSize(396.00),
                            decoration:
                                BoxDecoration(color: ColorConstant.indigo50),
                          );
                        },
                        itemCount: controller.topEventsModelObj.value
                            .topEventsItemModelList.length,
                        itemBuilder: (context, index) {
                          TopEventsItemModel model = controller
                              .topEventsModelObj
                              .value
                              .topEventsItemModelList[index];
                          return TopEventsItemWidgets(model);
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
}
