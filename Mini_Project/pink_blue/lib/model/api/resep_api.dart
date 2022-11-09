import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:pink_blue/model/dessert_model.dart';
import 'package:pink_blue/model/detail_model.dart';
import 'package:pink_blue/model/resep_model.dart';
import 'package:pink_blue/model/sarapan_model.dart';

class ResepAPI {
  static Future<ResepModel> getAllResep() async {
    final dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));

    final response = await dio.get(
        'https://masak-apa-tomorisakura.vercel.app/api/recipes-length/?limit=10');

    final results = ResepModel.fromJson(response.data);

    return results;
  }

  static Future<DetailResepModel> getDetailResep(String key) async {
    final dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));

    final response = await dio
        .get("https://masak-apa-tomorisakura.vercel.app/api/recipe/$key");

    final result = DetailResepModel.fromJson(response.data);

    return result;
  }

  static Future<DessertModel> getDessertResep() async {
    final dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));

    final response = await dio.get(
        "https://masak-apa-tomorisakura.vercel.app/api/category/recipes/resep-dessert");

    final dessert = DessertModel.fromJson(response.data);

    return dessert;
  }

  static Future<SarapanModel> getResepSarapan() async {
    final dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));

    final response = await dio.get(
        "https://masak-apa-tomorisakura.vercel.app/api/category/recipes/sarapan");

    final sarapan = SarapanModel.fromJson(response.data);

    return sarapan;
  }
}
