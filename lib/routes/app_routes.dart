import 'package:mixpanelapp/presentation/splash_screen/binding/splash_binding.dart';
import 'package:mixpanelapp/presentation/splash_screen/splash_screen.dart';
import 'package:mixpanelapp/presentation/top_events_screen/top_events_screen.dart';
import 'package:mixpanelapp/presentation/top_events_screen/binding/top_events_binding.dart';
import 'package:mixpanelapp/presentation/category_type_screen/category_type_screen.dart';
import 'package:mixpanelapp/presentation/category_type_screen/binding/category_type_binding.dart';
import 'package:mixpanelapp/presentation/all_events_screen/all_events_screen.dart';
import 'package:mixpanelapp/presentation/all_events_screen/binding/all_events_binding.dart';
import 'package:mixpanelapp/presentation/reminder_screen/reminder_screen.dart';
import 'package:mixpanelapp/presentation/reminder_screen/binding/reminder_binding.dart';
import 'package:mixpanelapp/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:mixpanelapp/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:get/get.dart';

class AppRoutes {
  static String topEventsScreen = '/top_events_screen';

  static String categoryTypeScreen = '/category_type_screen';

  static String allEventsScreen = '/all_events_screen';

  static String reminderScreen = '/reminder_screen';

  static String appNavigationScreen = '/app_navigation_screen';

  static String splashScreen = '/splash_screen';

  static String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: topEventsScreen,
      page: () => TopEventsScreen(),
      bindings: [
        TopEventsBinding(),
      ],
    ),
    GetPage(
      name: categoryTypeScreen,
      page: () => CategoryTypeScreen(),
      bindings: [
        CategoryTypeBinding(),
      ],
    ),
    GetPage(
      name: allEventsScreen,
      page: () => AllEventsScreen(),
      bindings: [
        AllEventsBinding(),
      ],
    ),
    GetPage(
      name: reminderScreen,
      page: () => ReminderScreen(),
      bindings: [
        ReminderBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    )
  ];
}
