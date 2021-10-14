import 'package:flutter/foundation.dart';

class UiProvider extends ChangeNotifier {
  int _selectedMenuOpt = 0;

  int get selectedMenuOptGet {
    return this._selectedMenuOpt;
  }

  set selectedMenuOptSet(int i) {
    this._selectedMenuOpt = i;

    // Notificar a los widgets escuchantes de algún cambio.
    notifyListeners();
  }
}
