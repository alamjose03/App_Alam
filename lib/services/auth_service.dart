import 'dart:convert';

import 'package:bellma/models/user_model.dart';
import 'package:bellma/ui/global.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
      return null;
    } else {
      return decodedResp['error']['message'];
    }
  }

  // void dataUser(String email) {
  //   final _db = FirebaseFirestore.instance;

  //   Future<DocumentSnapshot> snapshot =
  //       _db.collection('Users').doc(email).get();

  //   snapshot.then((DocumentSnapshot user) {
  //     Global.userModel = UserModel(
  //       name: user['Name'],
  //       flastname: user['LastNameP'],
  //       mlastname: user['LastNameM'],
  //       process: user['Process'],
  //       phone: user['Phone'],
  //       age: user['Age'],
  //       address: user['Address'],
  //       zipcode: user['Zipcode'],
  //       city: user['City'],
  //       image: user['Image'],
  //       email: user.id,
  //     );
  //   });
  // }
}
