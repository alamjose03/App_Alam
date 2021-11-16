import 'dart:convert';

import 'package:bellma/models/user_model.dart';
import 'package:bellma/ui/global.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends ChangeNotifier {
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = 'AIzaSyB2Nw34Rpc7ZhgOveOGgilLhtUR6A-lPko';
  final _db = FirebaseFirestore.instance;

  Future<String?> login(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password
    };

    final url = Uri.https(_baseUrl, '/v1/accounts:signInWithPassword', {
      'key': _firebaseToken,
    });

    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);

    if (decodedResp.containsKey('idToken')) {
      // Grabar token en el secure storage
      SharedPreferences prefs = await SharedPreferences.getInstance();

      Future<DocumentSnapshot> snapshot =
          _db.collection('Users').doc(email).get();

      await snapshot.then((DocumentSnapshot user) {
        Global.userModel = UserModel(
          name: user['Name'],
          flastname: user['LastNameP'],
          mlastname: user['LastNameM'],
          process: user['Process'],
          phone: user['Phone'],
          age: user['Age'],
          address: user['Address'],
          zipcode: user['Zipcode'],
          city: user['City'],
          image: user['Image'],
          email: user.id,
        );
      });
      String encodedUser = json.encode(Global.userModel);
      prefs.setString('user', encodedUser);

      return null;
    } else {
      return decodedResp['error']['message'];
    }
  }

  Future getUser() async {
    final prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> userMap = json.decode(prefs.getString('user')!);
    Global.userModel = UserModel.fromJson(userMap);
  }

  // Eliminar token del storage
  Future logout() async {
    final pref = await SharedPreferences.getInstance();
    pref.setString('user', '');
  }
}
