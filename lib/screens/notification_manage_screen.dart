import 'dart:ui';
import 'package:bellma/constants/colors_constant.dart';
import 'package:bellma/providers/time_provider.dart';
import 'package:bellma/ui/time_picker.dart';
import 'package:bellma/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationManageScreen extends StatelessWidget {
  static final String routeName = '/notificationManage';

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
      body: _NotificationManageScreenBody(),
    );
  }
}

class _NotificationManageScreenBody extends StatelessWidget {
  const _NotificationManageScreenBody({Key? key}) : super(key: key);
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
                  // leading: Text(
                  //   '${timeProvider.timeUserHourGet} : ${timeProvider.timeUserMinuteGet} hrs',
                  //   style: TextStyle(color: whiteColor),
                  // ),
                  leading: Icon(Icons.wb_sunny, color: Colors.yellow),

                  title: Text(
                    'Buenos días',
                    style: TextStyle(color: whiteColor, fontSize: 16.0),
                  ),
                  trailing: Text(
                    '${timeProvider.timeUserHourGet}:${timeProvider.timeUserMinuteGet} hrs',
                    style: TextStyle(color: whiteColor),
                  ),
                  // trailing: IconButton(
                  //   icon: Icon(
                  //     Icons.schedule,
                  //     color: whiteColor,
                  //   ),
                  //   onPressed: () async {
                  //     final NotificationPicker? pickedSchedule =
                  //         await pickSchedule(context);

                  //     if (pickedSchedule != null) {
                  //       noti.cancelNotification(0);
                  //       timeProvider.timeUserHourSet =
                  //           pickedSchedule.timeOfDay!.hour;
                  //       timeProvider.timeUserMinuteSet =
                  //           pickedSchedule.timeOfDay!.minute;
                  //       noti.scheduleDailyNotification(context);
                  //     }
                  //   },
                  // ),
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
                  // leading: Text(
                  //   '12:00 hrs',
                  //   style: TextStyle(color: whiteColor),
                  // ),
                  leading: Icon(Icons.wb_sunny, color: Colors.amber),
                  title: Text(
                    'Buenos tardes',
                    style: TextStyle(color: whiteColor, fontSize: 16.0),
                  ),
                  trailing: Text(
                    '12:00 hrs',
                    style: TextStyle(color: whiteColor),
                  ),
                ),
                onTap: () {
                  print('12:00');
                },
              ),
            ),
            SizedBox(height: 10.0),
            _CardBackground(
              child: GestureDetector(
                child: ListTile(
                  // leading: Text(
                  //   '19:00 hrs',
                  //   style: TextStyle(color: whiteColor),
                  // ),
                  leading:
                      Icon(Icons.nightlight_round_outlined, color: whiteColor),

                  title: Text(
                    'Buenas noches',
                    style: TextStyle(color: whiteColor, fontSize: 16.0),
                  ),
                  trailing: Text(
                    '19:00 hrs',
                    style: TextStyle(color: whiteColor),
                  ),
                ),
                onTap: () {
                  print('19:00');
                },
              ),
            ),
            SizedBox(height: 10.0),
            _CardBackground(
              child: GestureDetector(
                child: ListTile(
                  // leading: Text(
                  //   '22:00 hrs',
                  //   style: TextStyle(color: whiteColor),
                  // ),
                  leading: Icon(Icons.nights_stay, color: whiteColor),
                  title: Text(
                    'Hasta mañana',
                    style: TextStyle(color: whiteColor, fontSize: 16.0),
                  ),
                  trailing: Text(
                    '22:00 hrs',
                    style: TextStyle(color: whiteColor),
                  ),
                ),
                onTap: () {
                  print('20:00');
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
            child:  this.child,
              
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
