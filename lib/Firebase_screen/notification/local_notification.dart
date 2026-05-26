import 'package:flutter2026/constant/const.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class LocalNotification {
  static final _notification = FlutterLocalNotificationsPlugin();

  static Future init() async {
    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );

    final iosSetting = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    final settings = InitializationSettings(
      android: androidSettings,
      iOS: iosSetting,
    );

    await _notification.initialize(
      settings: settings,
      onDidReceiveNotificationResponse: (details) {
        print("====Notification click $details");
        _handleNavigation(details.payload);
      },
    );

    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
    OneSignal.initialize("7b9005b6-b2fb-452c-af75-e2d99631a1eb");
    OneSignal.Notifications.requestPermission(false);

    OneSignal.Notifications.addClickListener((event) {
      final screen = event.notification.additionalData?['screen'] as String;
      final id = event.notification.additionalData?["id"] as String?;
      _handleNavigation(screen, arguments: id);
    });

    OneSignal.Notifications.addForegroundWillDisplayListener((event) {
      event.preventDefault();
      final screen = event.notification.additionalData?["screen"] as String?;

      showNotification(
        payload: screen,
        title: event.notification.title,
        body: event.notification.body ?? "Unknow",
      );
    });
  }

  static void _handleNavigation(String? screen, {String? arguments}) {
    if (screen == null) return;
    navigatorKey.currentState?.pushNamed(screen, arguments: arguments);
  }

  static Future showNotification({
    int id = 0,
    String? title,
    String? payload,
    String body = "notification",
  }) async {
    //Android

    const androidDetails = AndroidNotificationDetails(
      "basic_id",
      "basic",
      channelDescription: "description",
      importance: Importance.max,
      priority: Priority.high,
    );

    const iosDetail = DarwinNotificationDetails();

    await _notification.show(
      id: id,
      title: title,
      body: body,
      payload: payload,
      notificationDetails: NotificationDetails(
        android: androidDetails,
        iOS: iosDetail,
      ),
    );
  }
}
