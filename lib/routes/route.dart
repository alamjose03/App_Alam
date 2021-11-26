import 'package:flutter/material.dart';
import 'package:bellma/screens/screens.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    LoginScreen.routeName: (BuildContext context) => LoginScreen(),
    HomeScreen.routeName: (BuildContext context) => HomeScreen(),
    StatisticsScreen.routeName: (BuildContext context) => StatisticsScreen(),
    ProfileScreen.routeName: (BuildContext context) => ProfileScreen(),
    NotificationScreen.routeName: (BuildContext context) =>
        NotificationScreen(),
    ProfileDetailScreen.routeName: (BuildContext context) =>
        ProfileDetailScreen(),
    ForgotPasswordScreen.routeName: (BuildContext context) =>
        ForgotPasswordScreen(),
  };
}
