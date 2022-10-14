import 'package:flutter/material.dart';
import 'package:section26/model/api/contact_api.dart';
import 'package:section26/model/contact_model.dart';

class ContactViewModel with ChangeNotifier {
  List<ContactModel> _contacts = [];
  List<ContactModel> get contacts => _contacts;

  getAllContacts() async {
    final c = await ContactAPI.getContact();
    _contacts = c;
    notifyListeners();
  }
}
