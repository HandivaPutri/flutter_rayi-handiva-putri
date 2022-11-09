import 'package:flutter/material.dart';
import 'package:pink_blue/model/api/resep_api.dart';
import 'package:pink_blue/model/sarapan_model.dart';

enum ResepSarapanViewState {
  none,
  loading,
  error,
}

class ResepSarapanViewModel with ChangeNotifier {
  ResepSarapanViewState _state = ResepSarapanViewState.none;
  ResepSarapanViewState get state => _state;

  changeState(ResepSarapanViewState s) {
    _state = s;
  }

  SarapanModel? _resepsarapan;
  SarapanModel? get resepsarapan => _resepsarapan;

  getResepSarapan() async {
    changeState(ResepSarapanViewState.loading);

    try {
      final c = await ResepAPI.getResepSarapan();
      _resepsarapan = c;

      changeState(ResepSarapanViewState.none);
    } catch (e) {
      changeState(ResepSarapanViewState.error);
    }
    notifyListeners();
  }
}
