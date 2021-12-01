import 'package:flutter/cupertino.dart';

class TimeUserProvider extends ChangeNotifier {
  int _timeUserHour = 9;
  int _timeUserMinute = 0;

  int get timeUserHourGet => _timeUserHour;
  int get timeUserMinuteGet => _timeUserMinute;

  set timeUserHourSet(int i) {
    this._timeUserHour = i;
    // notifyListeners();
  }

  set timeUserMinuteSet(int i) {
    this._timeUserMinute = i;
    // notifyListeners();
  }
}
