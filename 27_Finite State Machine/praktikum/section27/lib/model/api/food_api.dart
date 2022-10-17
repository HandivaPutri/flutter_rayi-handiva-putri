import 'package:section27/model/food_model.dart';
import 'package:dio/dio.dart';

class FoodAPI {
  Future<List<FoodModel>> getFood() async {
    final response = await Dio().get(
        'http://my-json-server.typicode.com/hadihammurabi/flutter-webservice/foods');

    List<FoodModel> contacts = (response.data as List)
        .map(
          (e) => FoodModel(
            id: e['id'],
            name: e['name'],
          ),
        )
        .toList();
    return contacts;
  }
}
