import 'package:bellma/providers/connection_status_provider.dart';
import 'package:bellma/screens/login_screen.dart';
import 'package:bellma/services/auth_service.dart';
import 'package:bellma/services/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bellma/providers/providers.dart';
import 'package:bellma/screens/screens.dart';
import 'package:bellma/routes/route.dart';
import 'package:bellma/providers/ui_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MyApp(prefs));
}

class MyApp extends StatelessWidget {
  final SharedPreferences pref;
  MyApp(this.pref);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UiProvider()),
        ChangeNotifierProvider(create: (_) => InputDialogProvider()),
        ChangeNotifierProvider(create: (_) => LoginFormProvider()),
        ChangeNotifierProvider(create: (_) => ConnectionStatusProvider()),
        ChangeNotifierProvider(create: (_) => AuthService()),
      ],
      child: MaterialApp(
        title: 'BellMa App',
        debugShowCheckedModeBanner: false,
        initialRoute:
            pref.getString('user') == null || pref.getString('user') == ''
                ? LoginScreen.routeName
                : HomeScreen.routeName,
        routes: getApplicationRoutes(),
        scaffoldMessengerKey: NotificationsService.messengerKey,
        theme: ThemeData(
          fontFamily: "Quicksand",
          appBarTheme: AppBarTheme(color: Colors.white),
        ),
      ),
    );
  }
}
