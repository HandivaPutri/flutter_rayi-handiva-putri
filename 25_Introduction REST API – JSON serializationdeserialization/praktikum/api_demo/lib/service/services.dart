import 'package:api_demo/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Service {
  final Dio dio = Dio();

  Future fetchUser() async {
    try {
      final Response response = await dio.get('https://reqres.in/api/users');

      debugPrint(response.data.toString());

      List<dynamic> data = response.data['data'];
      data.map((e) => UserModel.fromJson(e)).toList();

      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Data>?> fetchData() async {
    try {
      final Response response = await dio.get('https://reqres.in/api/users');

      debugPrint(response.data.toString());

      final result = UserModel.fromJson(response.data);
      return result.data;
    } catch (e) {
      rethrow;
    }
  }

  Future createUser({required String name, required String job}) async {
    try {
      final Response response = await dio.post(
        'https://reqres.in/api/users',
        data: {
          'name': name,
          'job': job,
        },
      );

      debugPrint(response.data.toString());

      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future updateUser({required String name, required String job}) async {
    try {
      final Response response = await dio.put(
        'https://reqres.in/api/users/4',
        data: {
          'name': name,
          'job': job,
        },
      );

      debugPrint(response.data.toString());

      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future deleteUser() async {
    try {
      final Response response = await dio.delete(
        'https://reqres.in/api/users/4',
      );

      debugPrint(response.data.toString());
    } catch (e) {
      rethrow;
    }
  }
}
