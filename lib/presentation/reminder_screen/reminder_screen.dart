import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mixpanelapp/data/apiClient/notification_api.dart';

import 'controller/reminder_controller.dart';
import 'package:flutter/material.dart';
import 'package:mixpanelapp/core/app_export.dart';
import 'package:mixpanelapp/widgets/custom_button.dart';
import 'package:mixpanelapp/widgets/custom_text_form_field.dart';

class ReminderScreen extends GetWidget<ReminderController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body: Container(
          width: size.width,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
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
                        decoration:
                            BoxDecoration(color: ColorConstant.indigoA200),
                        child: Padding(
                          padding: getPadding(right: 171),
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
                                    width: getHorizontalSize(15.00),
                                  ),
                                ),
                              ),
                              Text("lbl_reminder".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtLatoBold20.copyWith())
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: getPadding(left: 16, top: 33, right: 16),
                        child: Text(
                          "lbl_set_reminder".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtLatoMedium16.copyWith(),
                        ),
                      ),
                    ),
                    CustomTextFormField(
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: false),
                        validator: numberValidator,
                        width: 396,
                        focusNode: FocusNode(),
                        controller: controller.setCountController,
                        hintText: "msg_enter_your_text".tr,
                        margin: getMargin(left: 16, top: 16, right: 16),
                        textInputAction: TextInputAction.done),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.info_outline_rounded),
                            iconSize: 20.0,
                            color: ColorConstant.indigoA200),
                        Align(
                          child: Text(
                            "lbl_reminder_info".tr,
                            style: TextStyle(
                              fontSize: 12.0,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: getPadding(
                        top: 380,
                      ),
                      child: CustomButton(
                          width: 396,
                          text: "lbl_set_reminder".tr,
                          fontStyle: ButtonFontStyle.LatoMedium18,
                          onTap: onTapBtnSetReminder),
                    ),
                  ],
                ),
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

  onTapBtnSetReminder() {
    if (_formKey.currentState!.validate()) {
      var time = controller.setCountController.text.toString();
      getNotification(int.parse(time));
      Get.back(closeOverlays: true);
    }
  }

  void getNotification(int time) {
    var eventName = Get.find<PrefUtils>().getEventName();
    var eventType = Get.find<PrefUtils>().getEventType();
    try {
      Get.find<NotificationApi>().showNotification(
        id: 1,
        title: 'Reminder',
        body: 'Please check $eventName counts of $eventType category.',
        scheduleDate: DateTime.now().add(Duration(seconds: time)),
        payload: 'www.dhiwise.com',
      );
    } catch (ex, s) {
      print("Error is - $ex \n $s");
    }
  }

  String? numberValidator(String? value) {
    RegExp _regExp = RegExp(r'^[1-9][0-9]*$');
    if (_regExp.hasMatch(value ?? '')) {
      //
    } else {
      return 'Please enter numeric value without zero';
    }
    if(value!.length > 2){
      return 'Only 2 digits are allow';
    }
    return null;
  }
}
