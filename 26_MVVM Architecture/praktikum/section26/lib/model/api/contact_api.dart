import 'package:section26/model/contact_model.dart';
import 'package:dio/dio.dart';

class ContactAPI {
  static Future<List<ContactModel>> getContact() async {
    final response = await Dio().get(
        'http://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts');

    List<ContactModel> contacts = (response.data as List)
        .map(
          (e) => ContactModel(id: e['id'], name: e['name'], phone: e['phone']),
        )
        .toList();
    return contacts;
  }
}
