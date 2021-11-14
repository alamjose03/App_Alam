import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  // Referencia de nuestro formulario
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  // String que guardaran los datos ingresados en el form
  String email = '';
  String password = '';

  // Se ejecutará cuando le demos click al botón
  bool isValidForm() {
    print('$email - $password');
    print(formKey.currentState?.validate());

    // Ejecutara el validate del formulario y retprnara true o false si es correcto o no
    return formKey.currentState?.validate() ?? false;
  }
}
