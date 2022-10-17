import 'package:flutter/material.dart';
import 'package:section27/model/api/food_api.dart';
import 'package:section27/model/food_model.dart';

enum FoodViewState {
  none,
  loading,
  error,
}

class FoodViewModel with ChangeNotifier {
  FoodViewState _state = FoodViewState.none;
  FoodViewState get state => _state;

  changeState(FoodViewState s) {
    _state = s;
    notifyListeners();
  }

  List<FoodModel> _foods = [];
  List<FoodModel> get foods => _foods;

  getAllFood() async {
    changeState(FoodViewState.loading);

    // try {
    //   final f = await FoodAPI.getFood();
    //   _foods = f;
    //   notifyListeners();
    //   changeState(FoodViewState.none);
    // } catch (e) {
    //   changeState(FoodViewState.error);
    // }
  }
}
