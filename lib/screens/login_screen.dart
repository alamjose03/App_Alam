import 'package:flutter/material.dart';
import 'package:bellma/screens/screens.dart';
import 'package:bellma/responsive.dart';
import 'package:bellma/constants/colors_constant.dart';
import 'package:bellma/widgets/widgets.dart';
import 'package:bellma/ui/ui.dart';

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
                            'Log In',
                            style: TextStyle(
                              fontSize: responsive.dp(3.5),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: responsive.hp(1.5)),
                        _LoginForm(),
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
    );
  }
}

class _LoginForm extends StatefulWidget {
  @override
  __LoginFormState createState() => __LoginFormState();
}

class __LoginFormState extends State<_LoginForm> {
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Container(
      // El form tiene una referencia al estado de sus widgets internos
      child: Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecorationsUI.loginInputDecoration(
                  hintText: "example@gmail.com",
                  labelText: "Correo electrónico",
                  prefixIcon: Icons.email_outlined,
                ),
                cursorColor: magentaColor,
              ),
              SizedBox(height: 20.0),
              TextFormField(
                obscureText: _isHidden,
                autocorrect: false,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecorationsUI.loginInputDecoration(
                  hintText: "******",
                  labelText: "Contraseña",
                  prefixIcon: Icons.lock_outline,
                  suffix: InkWell(
                    child: Icon(
                      _isHidden ? Icons.visibility : Icons.visibility_off,
                      color: greyColor,
                    ),
                    onTap: () {
                      _togglePasswordView();
                    },
                  ),
                ),
                cursorColor: magentaColor,
              ),
              SizedBox(height: 5.0),
              TextButton(
                child: Row(
                  children: [
                    Text(
                      '¿Olvidaste tu contraseña?',
                      style: TextStyle(
                        color: magentaColor,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                onPressed: () {},
              ),
              SizedBox(height: 15.0),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                disabledColor: Colors.grey,
                color: magentaColor,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 125.0, vertical: 16.0),
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                },
              ),
              SizedBox(height: responsive.dp(15.0)),
              _development(),
            ],
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  Widget _development() {
    return Row(
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
    );
  }
}
