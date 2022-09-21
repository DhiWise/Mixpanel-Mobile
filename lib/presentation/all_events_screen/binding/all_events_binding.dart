import '../controller/all_events_controller.dart';
import 'package:get/get.dart';

class AllEventsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AllEventsController());
  }
}
