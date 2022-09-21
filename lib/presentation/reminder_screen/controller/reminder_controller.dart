import '/core/app_export.dart';
import 'package:mixpanelapp/presentation/reminder_screen/models/reminder_model.dart';
import 'package:flutter/material.dart';

class ReminderController extends GetxController {
  TextEditingController setCountController = TextEditingController();

  Rx<ReminderModel> reminderModelObj = ReminderModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    setCountController.dispose();
  }
}
