import 'package:mixpanelapp/core/app_export.dart';
import 'package:mixpanelapp/presentation/splash_screen/controller/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}
