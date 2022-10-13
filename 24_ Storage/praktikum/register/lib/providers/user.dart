import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:register/screens/home_screen.dart';

class User extends ChangeNotifier {
  late SharedPreferences registerdata;
  bool _newUser = false;
  bool _toogle = true;
  String _username = '';
  String _email = '';

  bool get toogle => _toogle;
  bool get newUser => _newUser;
  String get username => _username;
  String get email => _email;

  Future<void> checkRegister(BuildContext context) async {
    registerdata = await SharedPreferences.getInstance();
    _newUser = registerdata.getBool('register') ?? true;
    if (newUser == false) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
          (route) => false);
    }
    notifyListeners();
  }

  Future<void> addBool(bool a) async {
    registerdata = await SharedPreferences.getInstance();
    registerdata.setBool('register', a);
    notifyListeners();
  }

  Future<void> setName(String username) async {
    registerdata = await SharedPreferences.getInstance();
    registerdata.setString('username', username);
    notifyListeners();
  }

  Future<void> setEmail(String email) async {
    registerdata = await SharedPreferences.getInstance();
    registerdata.setString('email', email);
    notifyListeners();
  }

  Future<void> initial() async {
    registerdata = await SharedPreferences.getInstance();
    _username = registerdata.getString('username').toString();
    _email = registerdata.getString('email').toString();
    notifyListeners();
  }

  Future<void> deleteName(String username) async {
    registerdata = await SharedPreferences.getInstance();
    registerdata.remove('username');
    notifyListeners();
  }

  Future<void> deleteEmail(String email) async {
    registerdata = await SharedPreferences.getInstance();
    registerdata.remove('email');
    notifyListeners();
  }

  toogleTheme() {
    _toogle = !_toogle;
    notifyListeners();
  }
}
