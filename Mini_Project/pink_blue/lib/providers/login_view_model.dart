import 'package:flutter/material.dart';
import 'package:pink_blue/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel extends ChangeNotifier {
  late SharedPreferences logindata;
  bool _newUser = false;
  bool _toogle = true;
  String _username = '';
  String _email = '';

  bool get toogle => _toogle;
  bool get newUser => _newUser;
  String get username => _username;
  String get email => _email;

  Future<void> checkLogin(BuildContext context) async {
    logindata = await SharedPreferences.getInstance();
    _newUser = logindata.getBool('login') ?? true;
    if (newUser == false) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => Home(),
          ),
          (route) => false);
    }
    notifyListeners();
  }

  Future<void> addBool(bool a) async {
    logindata = await SharedPreferences.getInstance();
    logindata.setBool('login', a);
    notifyListeners();
  }

  Future<void> setName(String username) async {
    logindata = await SharedPreferences.getInstance();
    logindata.setString('username', username);
    notifyListeners();
  }

  Future<void> setEmail(String email) async {
    logindata = await SharedPreferences.getInstance();
    logindata.setString('email', email);
    notifyListeners();
  }

  Future<void> initial() async {
    logindata = await SharedPreferences.getInstance();
    _username = logindata.getString('username').toString();
    _email = logindata.getString('email').toString();
    notifyListeners();
  }

  Future<void> deleteName(String username) async {
    logindata = await SharedPreferences.getInstance();
    logindata.remove('username');
    notifyListeners();
  }

  Future<void> deleteEmail(String email) async {
    logindata = await SharedPreferences.getInstance();
    logindata.remove('email');
    notifyListeners();
  }

  toogleTheme() {
    _toogle = !_toogle;
    notifyListeners();
  }
}
