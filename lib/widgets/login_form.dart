import 'package:bellma/providers/connection_status_provider.dart';
import 'package:bellma/screens/screens.dart';
import 'package:bellma/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bellma/ui/ui.dart';
import 'package:bellma/providers/providers.dart';
import 'package:bellma/constants/colors_constant.dart';

class LoginFormWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    final connectionP = Provider.of<ConnectionStatusProvider>(context);
    final authService = Provider.of<AuthService>(context, listen: false);

    return Container(
      // El form tiene una referencia al estado de sus widgets internos
      child: Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
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
                onChanged: (value) => loginForm.email = value,
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
              SizedBox(height: 10.0),
              TextFormField(
                obscureText: loginForm.isHiddenGet,
                autocorrect: false,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecorationsUI.loginInputDecoration(
                  hintText: "******",
                  labelText: "Contraseña",
                  prefixIcon: Icons.lock_outline,
                  suffix: InkWell(
                    child: Icon(
                      loginForm.isHiddenGet
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: greyColor,
                    ),
                    onTap: () {
                      loginForm.isHiddenSet = !loginForm.isHiddenGet;
                    },
                  ),
                ),
                onChanged: (value) => loginForm.password = value,
                validator: (value) {
                  return (value != null && value.length >= 6)
                      ? null
                      : 'La contraseña debe de ser de 6 caracteres';
                },
                cursorColor: magentaColor,
              ),
              SizedBox(height: 3.0),
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
              SizedBox(height: 10.0),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                disabledColor: Colors.grey,
                color: magentaColor,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    loginForm.isLoadingGet ? 'Espere...' : 'Iniciar Sesión',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                onPressed: loginForm.isLoadingGet
                    ? null
                    : () async {
                        FocusScope.of(context).unfocus();

                        await connectionP.checkInternetConnection();
                        if (connectionP.isOnline) {
                          if (!loginForm.isValidForm()) return;

                          loginForm.isLoadingSet = true;

                          final String? errorMessage = await authService.login(
                              loginForm.email, loginForm.password);

                          if (errorMessage == null) {
                            Navigator.pushReplacementNamed(
                                context, HomeScreen.routeName);
                          } else {
                            print(errorMessage);
                            loginForm.isLoadingSet = false;
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Sin Conexión a Internet...')));
                        }
                      },
              ),
              // SizedBox(height: responsive.dp(13.0)),
              // _development(),
            ],
          ),
        ),
      ),
    );
  }
}
