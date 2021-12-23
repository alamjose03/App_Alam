import 'package:bellma/providers/time_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:bellma/ui/ui.dart';
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

  //Primera notificacón
  Future<void> scheduleDailyNotification(BuildContext context) async {
    final timeProvider = Provider.of<TimeUserProvider>(context, listen: false);
    final shared = SharedPreferencesTimeUI();

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

    int? hora = await shared.getTimeNotification('primeroh');

    if (hora == null) {
      shared.setTimeNotification('primeroh', hour);
    } else {
      shared.removeTimeNotification('primeroh');
      shared.setTimeNotification('primeroh', hour);
    }

    int? minuto = await shared.getTimeNotification('primerom');

    if (minuto == null) {
      shared.setTimeNotification('primerom', minute);
    } else {
      shared.removeTimeNotification('primerom');
      shared.setTimeNotification('primerom', minute);
    }
  }

  //Segunda notificacón
  Future<void> scheduleSecondNotification(BuildContext context) async {
    final timeProvider = Provider.of<TimeUserProvider>(context, listen: false);
    final shared = SharedPreferencesTimeUI();

    int hour = timeProvider.timeUserHourSecond;
    int minute = timeProvider.timeUserMinuteSecond;

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
      ),
    );
    await this.flutterLocalNotificationsPlugin.zonedSchedule(
          1,
          'El amor puede esperar, el hambre no! y de postre...',
          'Un buen libro estudiar para el éxito alcanzar',
          _nextInstanceDaily(hour, minute),
          details,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.wallClockTime,
          androidAllowWhileIdle: true,
          matchDateTimeComponents: DateTimeComponents.time,
        );
    int? hora = await shared.getTimeNotification('segundoh');
    if (hora == null) {
      shared.setTimeNotification('segundoh', hour);
    } else {
      shared.removeTimeNotification('segundoh');
      shared.setTimeNotification('segundoh', hour);
    }

    int? minuto = await shared.getTimeNotification('segundom');
    if (minuto == null) {
      shared.setTimeNotification('segundom', minute);
    } else {
      shared.removeTimeNotification('segundom');
      shared.setTimeNotification('segundom', minute);
    }
  }

  //Tercera notificación
  Future<void> scheduleThirdNotification(BuildContext context) async {
    final timeProvider = Provider.of<TimeUserProvider>(context, listen: false);
    final shared = SharedPreferencesTimeUI();

    int hour = timeProvider.timeUserHourThird;
    int minute = timeProvider.timeUserMinuteThird;

    var bigImage =
        BigPictureStyleInformation(DrawableResourceAndroidBitmap('notimage'));
    final details = NotificationDetails(
      android: AndroidNotificationDetails(
        'notification_program',
        'Notification Program',
        sound: RawResourceAndroidNotificationSound('res_custom_notification'),
        playSound: true,
        priority: Priority.high,
        importance: Importance.high,
      ),
    );

    await this.flutterLocalNotificationsPlugin.zonedSchedule(
          2,
          'Tus metas no tienen caducidad RESPIRA HONDO Y SIGUE...',
          'Que estás a punto de llegar',
          _nextInstanceDaily(hour, minute),
          details,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.wallClockTime,
          androidAllowWhileIdle: true,
          matchDateTimeComponents: DateTimeComponents.time,
        );

    int? hora = await shared.getTimeNotification('terceroh');
    if (hora == null) {
      shared.setTimeNotification('terceroh', hour);
    } else {
      shared.removeTimeNotification('terceroh');
      shared.setTimeNotification('terceroh', hour);
    }

    int? minuto = await shared.getTimeNotification('tercerom');
    if (minuto == null) {
      shared.setTimeNotification('tercerom', minute);
    } else {
      shared.removeTimeNotification('tercerom');
      shared.setTimeNotification('tercerom', minute);
    }
  }

  //Cuarta Notificación
  Future<void> scheduleFourthNotification(BuildContext context) async {
    final timeProvider = Provider.of<TimeUserProvider>(context, listen: false);
    final shared = SharedPreferencesTimeUI();

    int hour = timeProvider.timeUserHourFourth;
    int minute = timeProvider.timeUserMinuteFourth;
    var bigImage =
        BigPictureStyleInformation(DrawableResourceAndroidBitmap('notimage'));

    final details = NotificationDetails(
      android: AndroidNotificationDetails(
        'notification_program',
        'Notification Program',
        sound: RawResourceAndroidNotificationSound('res_custom_notification'),
        playSound: true,
        priority: Priority.high,
        importance: Importance.high,
      ),
    );

    await this.flutterLocalNotificationsPlugin.zonedSchedule(
          3,
          'Que tus sueños se culminen en éxito.',
          '',
          _nextInstanceDaily(hour, minute),
          details,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.wallClockTime,
          androidAllowWhileIdle: true,
          matchDateTimeComponents: DateTimeComponents.time,
        );
    int? hora = await shared.getTimeNotification('cuartah');
    if (hora == null) {
      shared.setTimeNotification('cuartah', hour);
    } else {
      shared.removeTimeNotification('cuartah');
      shared.setTimeNotification('cuartah', hour);
    }

    int? minuto = await shared.getTimeNotification('cuartam');
    if (minuto == null) {
      shared.setTimeNotification('cuartam', minute);
    } else {
      shared.removeTimeNotification('cuartam');
      shared.setTimeNotification('cuartam', minute);
    }
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
