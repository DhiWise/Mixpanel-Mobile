import '../controller/reminder_controller.dart';
import 'package:get/get.dart';

class ReminderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReminderController());
  }
}
