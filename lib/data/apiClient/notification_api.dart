import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
class NotificationApi {
  final FlutterLocalNotificationsPlugin notification;

  final notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'channel id',
        'channel body',
        channelDescription: 'channel description',
        importance: Importance.max,
        fullScreenIntent: true,
      ),
      iOS: IOSNotificationDetails());

  InitializationSettings _initializationSettings = InitializationSettings(
    android: AndroidInitializationSettings(
      'app_icon',
    ),
  );

  NotificationApi(this.notification) {
    initializeNotification();
    initializedTimeZone();
    print('notification initialized..');
  }

  initializeNotification() async {
    await notification.initialize(_initializationSettings);
  }

  initializedTimeZone() async {
    tz.initializeTimeZones();
    print('TZDateTime initialized..');
  }


  Future showNotification({
    required int id,
    required String? title,
    required String? body,
    required String? payload,
    required DateTime scheduleDate,
  }) async =>
      notification.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.from(scheduleDate, tz.getLocation('America/Detroit')) ,
        notificationDetails,
        payload: payload,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
      );
}
