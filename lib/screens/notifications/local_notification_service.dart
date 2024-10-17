import 'dart:developer';

import 'package:event_countdown/model/event.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
class LocalNotificationService{
  late final Event event;

  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static  onTap(NotificationResponse notificationResponse) {}

  static Future init()async{
   InitializationSettings settings = InitializationSettings(
   android: AndroidInitializationSettings('@mipmap/ic_launcher'),
     iOS: DarwinInitializationSettings()
   );

   flutterLocalNotificationsPlugin.initialize(settings,
   onDidReceiveNotificationResponse: onTap,
   onDidReceiveBackgroundNotificationResponse: onTap);

  }
  static void showScheduledNotification(Event event) async{
    NotificationDetails details = const NotificationDetails(
        android: AndroidNotificationDetails(
            'id 1',
            'scheduled notification',
            importance: Importance.max,
            priority: Priority.high
        ));
    tz.initializeTimeZones();
    log(tz.local.name);
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    log(currentTimeZone);
    tz.setLocalLocation(tz.getLocation(currentTimeZone));
    final eventDateTime = tz.TZDateTime(
      tz.local,
      event.date.year,
      event.date.month,
      event.date.day,
      event.time.hour,
      event.time.minute,
    ).subtract(Duration(hours: 2));
    await flutterLocalNotificationsPlugin.zonedSchedule(
        1,
        event.title,
        event.notes,
        eventDateTime,
        details,
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime);

  }
}