/*

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rider/configuration.dart';

class LocalNotificationService {
  static LocalNotificationService? _instance;

  LocalNotificationService._();

  factory LocalNotificationService.getInstance() {
    _instance ??= LocalNotificationService._();
    return _instance!;
  }

  Future<void> createLocalNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    await flutterNotificationPlugin.show(
        id,
        title,
        body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
          ),
          iOS: const IOSNotificationDetails(),
        ));
  }
}
*/
