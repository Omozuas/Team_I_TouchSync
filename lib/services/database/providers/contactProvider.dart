import 'package:flutter/material.dart';
import 'package:touchsync/services/database/contactDb.dart';
import 'package:touchsync/services/database/schemas/contact.schema.dart';

bool _isLoading = false;
bool get loading => _isLoading;
String _message = '';
String get message => _message;
setLoading(bool value) {
  _isLoading = value;
}

class Contactprovider extends ChangeNotifier {
  bool _isLoading = false;
  bool get loading => _isLoading;
  String _message = '';
  String get message => _message;
  setLoading(bool value) {
    _isLoading = value;
  }

  final ContactDatabaseHelper _databaseHelper = ContactDatabaseHelper.instance;
  List<ContactSchema> _profiles = [];
  List<ContactSchema> get profiles => _profiles;
  Contactprovider() {
    fetchProfiles();
  }

  Future<void> fetchProfiles(
      {String? filter, String? sortBy, bool ascending = true}) async {
    setLoading(true);
    _profiles = await _databaseHelper.fetchProfiles(
        filter: filter, sortBy: sortBy, ascending: ascending);

    setLoading(false);
    notifyListeners();
  }

  Future<void> addItem(ContactSchema profile) async {
    setLoading(true);
    await _databaseHelper.insertProfile(profile);
    fetchProfiles();
    setLoading(false);
    _message = ' ';
    notifyListeners();
  }

  Future<void> updateItem(ContactSchema profile) async {
    setLoading(true);
    await _databaseHelper.updateProfile(profile);
    fetchProfiles();
    setLoading(false);
    _message = ' ';
    notifyListeners();
  }

  Future<void> deleteItem(String id) async {
    setLoading(true);
    await _databaseHelper.deleteProfile(id);
    fetchProfiles();
    setLoading(false);
    _message = ' ';
    notifyListeners();
  }

  Future<ContactSchema?> getDatabyId(String id) async {
    setLoading(true);
    return await _databaseHelper.fetchProfileById(id);
  }
}
