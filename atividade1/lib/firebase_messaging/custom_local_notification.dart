import 'package:firebase_messaging_platform_interface/src/remote_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class CustomLocalNotification {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  late AndroidNotificationChannel channel;

  CustomLocalNotification() {
    channel = const AndroidNotificationChannel(
      'higt_importancfe_channel',
      'High Importance Notifications',
      description: 'This channel is udes for important notifications.',
      importance: Importance.max,
    );
    _configuraAndroid().then(
      (value) {
        flutterLocalNotificationsPlugin = value;
        inicializeNotification();
      },
    );
  }

  Future<FlutterLocalNotificationsPlugin> _configuraAndroid() async {
    var flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    return flutterLocalNotificationsPlugin;
  }

  inicializeNotification() {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
  }

  androidNotification(
    RemoteNotification notification,
    AndroidNotification android,
  ) {
    if (flutterLocalNotificationsPlugin != null) {
      flutterLocalNotificationsPlugin.show(
        1,
        notification.title,
        notification.body,
        const NotificationDetails(
            android: AndroidNotificationDetails(
          'default_notification_channel_id',
          'default_notification_channel_id',
          importance: Importance.high,
          priority: Priority.max,
          ticker: 'ticker',
          color: Colors.red,
        )),
      );
    }
  }
}
