import 'package:bellma/providers/time_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationsLocal {
  // Controlar la notificacion
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      new FlutterLocalNotificationsPlugin();

  // Inicializar la notificación
  init() {
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('America/Mexico_City'));
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');

    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    this.flutterLocalNotificationsPlugin.initialize(initializationSettings);
    print('Me inicialize');
  }

  Future<void> scheduleDailyNotification(BuildContext context) async {
    final timeProvider = Provider.of<TimeUserProvider>(context, listen: false);

    int hour = timeProvider.timeUserHourGet;
    int minute = timeProvider.timeUserMinuteGet;

    var bigImage = BigPictureStyleInformation(
      DrawableResourceAndroidBitmap('notimage'),
    );

    final details = NotificationDetails(
      android: AndroidNotificationDetails(
        'notification_program',
        'Notification Program',
        sound: RawResourceAndroidNotificationSound('res_custom_notification'),
        playSound: true,
        priority: Priority.high,
        importance: Importance.high,
        styleInformation: bigImage,
      ),
    );
    await this.flutterLocalNotificationsPlugin.zonedSchedule(
          0,
          'Ánimo',
          'Que tu día inicie con éxitos',
          _nextInstanceDaily(hour, minute),
          details,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.wallClockTime,
          androidAllowWhileIdle: true,
          matchDateTimeComponents: DateTimeComponents.time,
        );
  }

  tz.TZDateTime _nextInstanceDaily(hour, minute) {
    tz.TZDateTime scheduleDate = _nextDay(hour, minute);

    return scheduleDate;
  }

  tz.TZDateTime _nextDay(hour, minute) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);

    tz.TZDateTime scheduleDay =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minute);

    if (scheduleDay.isBefore(now)) {
      scheduleDay = scheduleDay.add(Duration(days: 1));
    }
    return scheduleDay;
  }

  Future<void> cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }
}
