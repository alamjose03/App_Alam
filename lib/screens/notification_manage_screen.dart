import 'dart:ui';
import 'package:bellma/constants/colors_constant.dart';
import 'package:bellma/providers/time_provider.dart';
import 'package:bellma/ui/time_picker.dart';
import 'package:bellma/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationManageScreen extends StatefulWidget {
  static final String routeName = '/notificationManage';

  @override
  _NotificationManageScreenState createState() =>
      _NotificationManageScreenState();
}

class _NotificationManageScreenState extends State<NotificationManageScreen> {
  final shared = SharedPreferencesTimeUI();
  int? primerH;
  int? primerM;
  int? segundoH;
  int? segundoM;
  int? terceroH;
  int? terceroM;
  int? cuartoH;
  int? cuartoM;

  @override
  void initState() {
    super.initState();
    shared.getTimeNotification('primeroh').then((value) {
      setState(() {
        primerH = value;
      });
    });
    shared.getTimeNotification('primerom').then((value) {
      setState(() {
        primerM = value;
      });
    });
    shared.getTimeNotification('segundoh').then((value) {
      setState(() {
        segundoH = value;
      });
    });
    shared.getTimeNotification('segundom').then((value) {
      setState(() {
        segundoM = value;
      });
    });
    shared.getTimeNotification('terceroh').then((value) {
      setState(() {
        terceroH = value;
      });
    });
    shared.getTimeNotification('tercerom').then((value) {
      setState(() {
        terceroM = value;
      });
    });
    shared.getTimeNotification('cuartah').then((value) {
      setState(() {
        cuartoH = value;
      });
    });
    shared.getTimeNotification('cuartam').then((value) {
      setState(() {
        cuartoM = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Administrar Recordatorios',
          style: TextStyle(color: blackColor),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: blackColor),
      ),
      body: _NotificationManageScreenBody(
        primeroh: primerH,
        primerM: primerM,
        segundoH: segundoH,
        segundoM: segundoM,
        terceroH: terceroH,
        terceroM: terceroM,
        cuartoH: cuartoH,
        cuartoM: cuartoM,
      ),
    );
  }
}

class _NotificationManageScreenBody extends StatelessWidget {
  final int? primeroh;
  final int? primerM;
  final int? segundoH;
  final int? segundoM;
  final int? terceroH;
  final int? terceroM;
  final int? cuartoH;
  final int? cuartoM;
  _NotificationManageScreenBody({
    Key? key,
    required this.primeroh,
    required this.primerM,
    required this.segundoH,
    required this.segundoM,
    required this.terceroH,
    required this.terceroM,
    required this.cuartoH,
    required this.cuartoM,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final timeProvider = Provider.of<TimeUserProvider>(context);
    final NotificationsLocal noti = NotificationsLocal();
    return Container(
      width: double.infinity,
      // height: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _CardBackground(
              child: GestureDetector(
                child: ListTile(
                  leading: Icon(Icons.wb_sunny, color: Colors.yellow),
                  title: Text(
                    'Buenos días',
                    style: TextStyle(color: whiteColor, fontSize: 16.0),
                  ),
                  trailing: Text(
                    '$primeroh: $primerM hrs',
                    style: TextStyle(color: whiteColor),
                  ),
                ),
                onTap: () async {
                  final NotificationPicker? pickedSchedule =
                      await pickSchedule(context);

                  if (pickedSchedule != null) {
                    noti.cancelNotification(0);
                    timeProvider.timeUserHourSet =
                        pickedSchedule.timeOfDay!.hour;
                    timeProvider.timeUserMinuteSet =
                        pickedSchedule.timeOfDay!.minute;
                    noti.scheduleDailyNotification(context);
                  }
                },
              ),
            ),
            SizedBox(height: 10.0),
            _CardBackground(
              child: GestureDetector(
                child: ListTile(
                  leading: Icon(Icons.wb_sunny, color: Colors.amber),
                  title: Text(
                    'Buenos tardes',
                    style: TextStyle(color: whiteColor, fontSize: 16.0),
                  ),
                  trailing: Text(
                    '$segundoH:$segundoM hrs',
                    style: TextStyle(color: whiteColor),
                  ),
                ),
                onTap: () async {
                  final NotificationPicker? pickedSchedule =
                      await pickSchedule(context);
                  if (pickedSchedule != null) {
                    noti.cancelNotification(1);
                    timeProvider.timeUserHourSecondSet =
                        pickedSchedule.timeOfDay!.hour;
                    timeProvider.timeUserMinuteSecondSet =
                        pickedSchedule.timeOfDay!.minute;
                    noti.scheduleSecondNotification(context);
                  }
                },
              ),
            ),
            SizedBox(height: 10.0),
            _CardBackground(
              child: GestureDetector(
                child: ListTile(
                  leading:
                      Icon(Icons.nightlight_round_outlined, color: whiteColor),
                  title: Text(
                    'Buenas noches',
                    style: TextStyle(color: whiteColor, fontSize: 16.0),
                  ),
                  trailing: Text(
                    '$terceroH:$terceroM hrs',
                    style: TextStyle(color: whiteColor),
                  ),
                ),
                onTap: () async {
                  final NotificationPicker? pickedSchedule =
                      await pickSchedule(context);
                  if (pickedSchedule != null) {
                    noti.cancelNotification(2);
                    timeProvider.timeUserHourThirdSet =
                        pickedSchedule.timeOfDay!.hour;
                    timeProvider.timeUserMinuteThirdSet =
                        pickedSchedule.timeOfDay!.minute;
                    noti.scheduleThirdNotification(context);
                  }
                },
              ),
            ),
            SizedBox(height: 10.0),
            _CardBackground(
              child: GestureDetector(
                child: ListTile(
                  leading: Icon(Icons.nights_stay, color: whiteColor),
                  title: Text(
                    'Hasta mañana',
                    style: TextStyle(color: whiteColor, fontSize: 16.0),
                  ),
                  trailing: Text(
                    '$cuartoH:$cuartoM hrs',
                    style: TextStyle(color: whiteColor),
                  ),
                ),
                onTap: () async {
                  final NotificationPicker? pickedSchedule =
                      await pickSchedule(context);
                  if (pickedSchedule != null) {
                    noti.cancelNotification(3);
                    timeProvider.timeUserHourFourthSet =
                        pickedSchedule.timeOfDay!.hour;
                    timeProvider.timeUserMinuteFourthSet =
                        pickedSchedule.timeOfDay!.minute;
                    noti.scheduleFourthNotification(context);
                  }
                },
              ),
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}

class _CardBackground extends StatelessWidget {
  final Widget child;
  const _CardBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
      // Se va encargar de que el blur se corte y no se expanda del container
      child: ClipRRect(
        // borderRadius: BorderRadius.circular(5.0),
        child: BackdropFilter(
          // Se encargará del blur(difuminado)
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            height: 55.0,
            decoration: BoxDecoration(
              color: Color.fromRGBO(21, 30, 34, 0.4),
              // color: Color.fromRGBO(62, 66, 107, 0.7),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: this.child,
          ),
        ),
      ),
    );
  }
}

// class _CardRow extends StatelessWidget {
//   final String time;
//   final String title;

//   _CardRow(
//       {Key? key,
//       required this.time,
//       required this.title,
//       })
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final NotificationsLocal noti = new NotificationsLocal();
//     return ListTile(
//       leading: Text(
//         '${this.time}0 hrs',
//         style: TextStyle(color: whiteColor),
//       ),
//       title: Text(
//         this.title,
//         style: TextStyle(color: whiteColor, fontSize: 16.0),
//       ),
//       trailing: IconButton(
//         onPressed: textOntap != null ? () => noti.textOntap : null,
//         icon: Icon(
//           this.icon,
//           color: whiteColor,
//         ),
//       ),
//     );
//     // return Row(
//     //   mainAxisAlignment: MainAxisAlignment.spaceAround,
//     //   mainAxisSize: MainAxisSize.max,
//     //   children: [
//     //   Text(
//     //     '${this.time}0 hrs',
//     //     style: TextStyle(color: whiteColor),
//     //   ),
//     //   Text(
//     //     this.title,
//     //     style: TextStyle(color: whiteColor, fontSize: 16.0),
//     //   ),
//     //   IconButton(
//     //     onPressed: () {},
//     //     icon: Icon(
//     //       this.icon,
//     //       color: whiteColor,
//     //     ),
//     //   ),
//     // ],
//     // );
//   }
// }
