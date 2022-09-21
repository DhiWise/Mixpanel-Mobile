import 'controller/category_type_controller.dart';
import 'package:flutter/material.dart';
import 'package:mixpanelapp/core/app_export.dart';
import 'package:mixpanelapp/widgets/custom_button.dart';
import 'package:mixpanelapp/widgets/custom_drop_down.dart';

class CategoryTypeScreen extends GetWidget<CategoryTypeController> {
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              width: size.width,
                              decoration: BoxDecoration(
                                  color: ColorConstant.indigoA200),
                              child: Padding(
                                  padding: getPadding(
                                    right: 150,
                                  ),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              onTapBackButton();
                                            },
                                            child: Container(
                                              padding: getPadding(all: 28),
                                              child: CommonImageView(
                                                  svgPath: ImageConstant
                                                      .imgArrowleft,
                                                  height: getSize(15.00),
                                                  width: getSize(15.00)),
                                            )),
                                        Text("lbl_event".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtApercuBold20
                                                .copyWith())
                                      ])))),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: getPadding(left: 16, top: 34, right: 16),
                              child: Text("lbl_category_type".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style:
                                      AppStyle.txtApercuMedium16.copyWith()))),
                      CustomDropDown(
                          width: 396,
                          focusNode: FocusNode(),
                          icon: Container(
                              margin: getMargin(left: 30, right: 20),
                              child: CommonImageView(
                                  svgPath: ImageConstant.imgArrowdown)),
                          hintText: "Select Type".tr,
                          margin: getMargin(left: 16, top: 15, right: 16),
                          items: controller
                              .categoryTypeModelObj.value.dropdownItemList,
                          onChanged: (value) {
                            controller.onSelected(value);
                          }),
                      Padding(
                        padding: getPadding(
                          top: 430,
                        ),
                        child: CustomButton(
                            width: 396,
                            text: "lbl_get_event_data".tr,
                            onTap: onTapBtnGeteventdata),
                      )
                    ]))))));
  }

  onTapBackButton() {
    Get.offAllNamed(AppRoutes.topEventsScreen);
  }

  onTapBtnGeteventdata() {
    if (controller.selectedDropDownValue?.value == null) {
      Get.snackbar('', "Please Select Category Type");
    } else {
      Get.find<PrefUtils>()
          .setEventType(controller.selectedDropDownValue?.value);
      Get.toNamed(AppRoutes.allEventsScreen);
    }
  }
}
