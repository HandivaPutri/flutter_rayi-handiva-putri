import 'package:flutter/material.dart';
import 'package:pink_blue/model/api/resep_api.dart';
import 'package:pink_blue/model/detail_model.dart';

enum DetailResepViewState {
  none,
  loading,
  error,
}

class DetailResepViewModel with ChangeNotifier {
  DetailResepViewState _detail = DetailResepViewState.none;
  DetailResepViewState get detail => _detail;

  changeState(DetailResepViewState d) {
    _detail = d;
  }

  DetailResepModel? _resepdetail;
  DetailResepModel? get resepdetail => _resepdetail;

  getDetailResep(key) async {
    changeState(DetailResepViewState.loading);

    try {
      final d = await ResepAPI.getDetailResep(key);
      _resepdetail = d;

      changeState(DetailResepViewState.none);
    } catch (e) {
      changeState(DetailResepViewState.error);
    }
    notifyListeners();
  }
}
