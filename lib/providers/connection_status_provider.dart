import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';

class ConnectionStatusProvider extends ChangeNotifier {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription _connectionSubscription;

  bool _isOnline = false;

  bool get isOnline => this._isOnline;

  ConnectionStatusProvider() {
    _connectionSubscription = _connectivity.onConnectivityChanged
        .listen((_) => checkInternetConnection());
  }

  Future<void> checkInternetConnection() async {
    try {
      await Future.delayed(Duration(microseconds: 500));
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        _isOnline = true;
      } else {
        _isOnline = false;
      }
    } on SocketException catch (_) {
      _isOnline = false;
    }
    notifyListeners();
  }

  @override
  void dispose() {
    _connectionSubscription.cancel();
    super.dispose();
  }
}
