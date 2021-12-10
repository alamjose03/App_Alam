import 'package:flutter/cupertino.dart';

class TimeUserProvider extends ChangeNotifier {
  int _timeUserHour = 9;
  int _timeUserMinute = 0;

  int _timeUserHourSecond = 14;
  int _timeUserMinuteSecond = 0;

  int _timeUserHourThird = 17;
  int _timeUserMinuteThird = 0;

  int _timeUserHourFourth = 20;
  int _timeUserMinuteFourth = 0;

  int get timeUserHourGet => _timeUserHour;
  int get timeUserMinuteGet => _timeUserMinute;

  int get timeUserHourSecond => _timeUserHourSecond;
  int get timeUserMinuteSecond => _timeUserMinuteSecond;

  int get timeUserHourThird => _timeUserHourThird;
  int get timeUserMinuteThird => _timeUserMinuteThird;

  int get timeUserHourFourth => _timeUserHourFourth;
  int get timeUserMinuteFourth => _timeUserMinuteFourth;

  set timeUserHourSet(int i) {
    this._timeUserHour = i;
    // notifyListeners();
  }

  set timeUserMinuteSet(int i) {
    this._timeUserMinute = i;
    // notifyListeners();
  }

  set timeUserHourSecondSet(int i) {
    this._timeUserHourSecond = i;
  }

  set timeUserMinuteSecondSet(int i) {
    this._timeUserMinuteSecond = i;
  }

  set timeUserHourThirdSet(int i) {
    this._timeUserHourThird = i;
  }

  set timeUserMinuteThirdSet(int i) {
    this._timeUserMinuteThird = i;
  }

  set timeUserHourFourthSet(int i) {
    this._timeUserHourFourth = i;
  }

  set timeUserMinuteFourthSet(int i) {
    this._timeUserMinuteFourth = i;
  }
}
