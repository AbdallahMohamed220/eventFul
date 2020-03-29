import 'dart:convert';
import 'dart:core';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

final usersRef = Firestore.instance.collection('users');

class Auth extends ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;
  String username;
  //Timer _authTimer;
  var uuid = Uuid();

  bool get isAuth {
    return token != null;
  }

  String get token {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  String get userId {
    return _userId;
  }

  Future<void> _athuntication(
      String email, String password, String _urlSegmet) async {
    try {
      final url =
          'https://identitytoolkit.googleapis.com/v1/$_urlSegmet?key=AIzaSyD2b_iY55XQpzs726phBzPOpnWxSiJFL_M';
      final response = await http.post(url,
          body: json.encode({
            'email': email,
            'password': password,
            'returnSecureToken': true
          }));
      await getUser(email: email);
      final responseData = json.decode(response.body);
      // print(responseData);
      // print(responseData['username']);
      // if (responseData['error'] != null) {
      //   throw HttpException(responseData['error']['message']);
      // }

      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _expiryDate = DateTime.now()
          .add(Duration(seconds: int.parse(responseData['expiresIn'])));
      //  _autoLogout();
      //final prefes = await SharedPreferences.getInstance();
      // final userData = json.encode({
      //   'token': _token,
      //   'userId': userId,
      //   'expiryData': _expiryDate.toIso8601String()
      // });

      // prefes.setString('userData', userData);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> getUser({String email}) async {
    final QuerySnapshot snapshot =
        await usersRef.where('email', isEqualTo: email).getDocuments();
    snapshot.documents.forEach((DocumentSnapshot doc) {
      username = doc.data['username'];
      print(username);
    });
  }

  Future<void> singIn({String email, String password}) async {
    await getUser(email: email);
    return _athuntication(email, password, 'accounts:signInWithPassword');
  }

  Future<void> createUser(
      {String username,
      String email,
      String password,
      String typeOfUser}) async {
    await usersRef.document(uuid.v1()).setData({
      'id': uuid.v1(),
      "username": username,
      "email": email,
      "password": password,
      'typeOfUser': typeOfUser
    });
  }

  Future<void> singUp(
      {String username,
      String email,
      String password,
      String typeOfUser}) async {
    await createUser(
      username: username,
      email: email,
      password: password,
      typeOfUser: typeOfUser,
    );
    return _athuntication(email, password, 'accounts:signUp');
  }

  // Future<void> logout() async {
  //   _token = null;
  //   _expiryDate = null;
  //   _userId = null;
  //   if (_authTimer != null) {
  //     _authTimer.cancel();
  //     _authTimer = null;
  //   }
  //   notifyListeners();
  //   final prefes = await SharedPreferences.getInstance();
  //   prefes.clear();
  // }

  // void _autoLogout() {
  //   if (_authTimer != null) {
  //     _authTimer.cancel();
  //   }
  //   final timeToExpiry = _expiryDate.difference(DateTime.now()).inSeconds;
  //   print(timeToExpiry);
  //   Timer(Duration(seconds: timeToExpiry), logout);
  // }

  // Future<bool> tryAutoLogin() async {
  //   final prefes = await SharedPreferences.getInstance();
  //   if (!prefes.containsKey('userData')) {
  //     return false;
  //   }
  //   final extractData =
  //       json.decode(prefes.getString('userData')) as Map<String, dynamic>;
  //   final expiryData = DateTime.parse(extractData['expiryData']);

  //   if (expiryData.isBefore(DateTime.now())) {
  //     return false;
  //   }

  //   _token = extractData['token'];
  //   _userId = extractData['userId'];
  //   _expiryDate = expiryData;

  //   notifyListeners();
  //   _autoLogout();
  //   return true;
  // }
}
