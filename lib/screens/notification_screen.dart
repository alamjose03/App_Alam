import 'package:flutter/material.dart';
import 'package:bellma/constants/colors_constant.dart';

class NotificationScreen extends StatelessWidget {
  static final String routeName = '/notification';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notificaciones', style: TextStyle(color: blackColor)),
        centerTitle: true,
        iconTheme: IconThemeData(color: blackColor),
      ),
      body: Center(
        child: Text('Hola Mundo'),
      ),
    );
  }
}
