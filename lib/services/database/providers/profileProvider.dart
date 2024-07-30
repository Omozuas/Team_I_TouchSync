import 'package:flutter/material.dart';
import 'package:touchsync/services/database/realm.db.dart';
import 'package:touchsync/services/database/schemas/profie.schema.dart';

bool _isLoading = false;
bool get loading => _isLoading;
String _message = '';
String get message => _message;
setLoading(bool value) {
  _isLoading = value;
}

class Profileprovider extends ChangeNotifier {
  bool _isLoading = false;
  bool get loading => _isLoading;
  String _message = '';
  String get message => _message;
  setLoading(bool value) {
    _isLoading = value;
  }

  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;
  List<ProfileSchema> _profiles = [];
  List<ProfileSchema> get profiles => _profiles;
  Profileprovider() {
    fetchProfiles();
  }
  Future<void> fetchProfiles() async {
    setLoading(true);
    _profiles = await _databaseHelper.fetchProfiles();

    setLoading(false);
    notifyListeners();
  }

  Future<void> addItem(ProfileSchema profile) async {
    setLoading(true);
    await _databaseHelper.insertProfile(profile);
    fetchProfiles();
    setLoading(false);
    _message = ' ';
    notifyListeners();
  }

  Future<void> updateItem(ProfileSchema profile) async {
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

  Future<ProfileSchema?> getDatabyId(String id) async {
    setLoading(true);
    return await _databaseHelper.fetchProfileById(id);
  }
}
