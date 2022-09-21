import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mixpanelapp/core/app_export.dart';
import 'package:mixpanelapp/data/apiClient/api_client.dart';
import 'package:mixpanelapp/data/apiClient/notification_api.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PrefUtils());
    Get.put(ApiClient());
    Connectivity connectivity = Connectivity();
    Get.put(NetworkInfo(connectivity));
    Get.put(NotificationApi(FlutterLocalNotificationsPlugin()));
  }
}
