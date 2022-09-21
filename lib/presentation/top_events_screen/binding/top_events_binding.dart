import '../controller/top_events_controller.dart';
import 'package:get/get.dart';

class TopEventsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TopEventsController());
  }
}
