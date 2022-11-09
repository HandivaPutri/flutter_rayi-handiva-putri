import 'package:flutter/material.dart';
import 'package:pink_blue/model/api/resep_api.dart';
import 'package:pink_blue/model/resep_model.dart';

enum ResepViewState {
  none,
  loading,
  error,
}

class ResepViewModel with ChangeNotifier {
  ResepViewState _state = ResepViewState.none;
  ResepViewState get state => _state;

  changeState(ResepViewState s) {
    _state = s;
  }

  ResepModel? _reseps;
  ResepModel? get reseps => _reseps;

  getAllResep() async {
    changeState(ResepViewState.loading);

    try {
      final c = await ResepAPI.getAllResep();
      _reseps = c;

      changeState(ResepViewState.none);
    } catch (e) {
      changeState(ResepViewState.error);
    }
    notifyListeners();
  }
}
