import 'package:section27/model/food_model.dart';
import 'package:test/test.dart';
import 'package:section27/model/api/food_api.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'food_api_test.mocks.dart';

@GenerateMocks([FoodAPI])
void main() {
  group('FoodAPI', () {
    FoodAPI foodAPI = MockFoodAPI();

    test('get all foods return data', () async {
      when(foodAPI.getFood()).thenAnswer(
        (_) async => <FoodModel>[
          FoodModel(id: 3, name: 'Ayam Goreng'),
        ],
      );
      var foods = await foodAPI.getFood();
      expect(foods.isNotEmpty, true);
    });
  });
}
