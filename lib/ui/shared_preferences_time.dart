import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesTimeUI {
  // Obtener el valor segun la llave
  Future getTimeNotification(String llave) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getInt(llave) != null) {
      return preferences.getInt(llave);
    }
    return null;
  }

  // Ingresar datos al sharedPreferences
  Future setTimeNotification(String llave, int valor) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt(llave, valor);
  }

  //Remover los valores de las llaves
  Future removeTimeNotification(String llave) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(llave);
  }
}
