import 'package:flutter/material.dart';
import 'package:touchsync/services/database/realm.db.dart';
import 'package:touchsync/services/database/schemas/profie.schema.dart';

class Profileprovider extends ChangeNotifier {
  bool _isLoading = false;
  bool get loading => _isLoading;
  String _message = '';
  String get message => _message;
  ProfileSchema? _getbyId;
  ProfileSchema? get getbyId => _getbyId;
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

  Future<void> getDatabyId(String id) async {
    setLoading(true);
    _getbyId = await _databaseHelper.fetchProfileById(id);
    setLoading(false);
    notifyListeners();
  }

  Future<void> updateProfileField(String id, String field, String value) async {
    setLoading(true);
    ProfileSchema? profile = await DatabaseHelper.instance.fetchProfileById(id);
    if (profile != null) {
      Map<String, dynamic> updatedFields = profile.toMap();
      updatedFields[field] = value;
      ProfileSchema updatedProfile = ProfileSchema.fromMap(updatedFields);
      await DatabaseHelper.instance.updateProfile(updatedProfile);
      setLoading(false);
      notifyListeners();
    }
    setLoading(false);
    notifyListeners();
  }

  Future<Map<String, dynamic>> getSocialMediaLinksByUserId(String id) async {
    setLoading(true);
    var result = await _databaseHelper.getSocialMediaLinksById(id);
    setLoading(false);
    notifyListeners();
    return result;
  }
}
