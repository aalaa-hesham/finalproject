import 'package:finalproject/models/model.dart';
import 'package:flutter/foundation.dart';

class ContactProvider extends ChangeNotifier {
  List<contact> _contacts = [];

  List<contact> get contacts => _contacts;

  void addContact(contact newContact) {
    _contacts.add(newContact);
    notifyListeners();
  }
}