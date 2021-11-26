import 'package:bellma/constants/colors_constant.dart';
import 'package:bellma/providers/login_form_provider.dart';
import 'package:bellma/responsive.dart';
import 'package:bellma/services/auth_service.dart';
import 'package:bellma/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static final String routeName = '/forgotPassword';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: blackColor),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: ForgotPasswordScreenBody(),
    );
  }
}

class ForgotPasswordScreenBody extends StatelessWidget {
  const ForgotPasswordScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    final authService = Provider.of<AuthService>(context);

    final Responsive responsive = Responsive.of(context);
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Container(
        height: responsive.hp(80),
        width: responsive.wp(100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '¿Olvidaste tu Contraseña?',
              style: TextStyle(
                color: blackColor,
                fontSize: responsive.dp(2.8),
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Ingrese el correo electrónico asociado con su cuenta y le enviaremos un correo electrónico con instrucciones para restablecer su contraseña.',
              style: TextStyle(color: blackColor, fontSize: responsive.dp(1.6)),
            ),
            SizedBox(height: responsive.dp(3)),
            Form(
              key: loginForm.formKeyForgot,
              child: TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecorationsUI.loginInputDecoration(
                  hintText: "example@gmail.com",
                  labelText: "Correo electrónico",
                  prefixIcon: Icons.email_outlined,
                ),
                onChanged: (value) => loginForm.forgotPassword = value,
                validator: (value) {
                  String pattern =
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regExp = new RegExp(pattern);

                  return regExp.hasMatch(value ?? '')
                      ? null
                      : 'El valor ingresado no luce como un correo';
                },
                cursorColor: magentaColor,
              ),
            ),
            SizedBox(height: responsive.dp(2.5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  disabledColor: Colors.grey,
                  color: magentaColor,
                  child: Container(
                    width: responsive.wp(50.0),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      'Enviar',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  onPressed: () async {
                    if (!loginForm.isValidForgot()) return;
                    await authService.forgotPassword(
                      loginForm.forgotPassword,
                      context,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
