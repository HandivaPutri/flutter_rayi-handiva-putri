import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:section27/screen/food/food_screen.dart';
import 'package:section27/screen/food/food_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => FoodViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FoodScreen(),
      ),
    ),
  );
}
