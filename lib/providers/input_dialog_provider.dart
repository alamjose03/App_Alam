import 'package:flutter/foundation.dart';

class InputDialogProvider extends ChangeNotifier {
  int _tEstudio = 0;
  int _tEvaluaciones = 0;

  int get timeStudyInputGet {
    return this._tEstudio;
  }

  int get timeEvaluationInputGet {
    return this._tEvaluaciones;
  }

  set timeStudyInputSet(int i) {
    this._tEstudio = i;

    // Notificar a los widgets escuchantes de algún cambio.
    notifyListeners();
  }

  set timeEvaluationInputSet(int i) {
    this._tEvaluaciones = i;

    // Notificar a los widgets escuchantes de algún cambio.
    notifyListeners();
  }
}
