import 'package:flutter/material.dart';
import 'package:bellma/responsive.dart';
import 'package:bellma/widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  static final String routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          LoginBackgroundWidget(
            // Si queremos que solo se mueva el card sin el fondo
            // la columna va entre el SingleChildScrollView
            child: Column(
              children: [
                SizedBox(height: responsive.hp(30)),
                Container(
                  child: CardContainerWidget(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: responsive.hp(3.0)),
                        Padding(
                          padding: const EdgeInsets.only(left: 26.0),
                          child: Text(
                            'Iniciar Sesión',
                            style: TextStyle(
                              fontSize: responsive.dp(3.5),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: responsive.hp(1.5)),
                        LoginFormWidget()
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // _LoginForm(),
        ],
      ),
      bottomNavigationBar: _development(),
    );
  }

  Widget _development() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Power By ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Image(
            image: AssetImage('assets/img/LogoUnivelmas.png'),
            width: 65.0,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
