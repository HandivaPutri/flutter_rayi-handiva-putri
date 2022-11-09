import 'package:flutter/material.dart';
import 'package:pink_blue/model/api/resep_api.dart';
import 'package:pink_blue/model/dessert_model.dart';

enum ResepDessertViewState {
  none,
  loading,
  error,
}

class ResepDessertViewModel with ChangeNotifier {
  ResepDessertViewState _dessert = ResepDessertViewState.none;
  ResepDessertViewState get dessert => _dessert;

  changeState(ResepDessertViewState d) {
    _dessert = d;
  }

  DessertModel? _resepdessert;
  DessertModel? get resepdessert => _resepdessert;

  getDessertResep() async {
    changeState(ResepDessertViewState.loading);

    try {
      final rd = await ResepAPI.getDessertResep();
      _resepdessert = rd;

      changeState(ResepDessertViewState.none);
    } catch (e) {
      changeState(ResepDessertViewState.error);
    }
    notifyListeners();
  }
}
