import 'package:flutter/material.dart';
import 'package:project/models/user_model.dart';

class UserViewModel extends ChangeNotifier {
  final _userModels = <UserModel>[];
  List<UserModel> get userModels => List.unmodifiable(_userModels);

  void deleteUser(int index) {
    _userModels.removeAt(index);
    notifyListeners();
  }

  void addUser(UserModel task) {
    _userModels.add(task);
    notifyListeners();
  }
}
