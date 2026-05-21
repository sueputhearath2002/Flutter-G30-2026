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
        // _handleNavigation(details.payload)
      },
    );

    // To do forgroundDisplay

    //====================

    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
    OneSignal.initialize("7b9005b6-b2fb-452c-af75-e2d99631a1eb");
    OneSignal.Notifications.requestPermission(false);
    OneSignal.Notifications.addClickListener((event) {
      final screen = event.notification.additionalData?['screen'] as String;
      final id = event.notification.additionalData?['id'] as String;
    });
  }
}
