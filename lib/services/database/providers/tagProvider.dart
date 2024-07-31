import 'package:flutter/material.dart';

import 'package:touchsync/services/database/schemas/tag.schema.dart';
import 'package:touchsync/services/database/tagbd.dart';

class Tagprovider extends ChangeNotifier {
  bool _isLoading = false;
  bool get loading => _isLoading;
  String _message = '';
  String get message => _message;
  TagSchema? _getbyId;
  TagSchema? get getbyId => _getbyId;
  setLoading(bool value) {
    _isLoading = value;
  }

  final DatabaseHelper1 _databaseHelper = DatabaseHelper1.instance;
  List<TagSchema> _tags = [];
  List<TagSchema> get profiles => _tags;
  Tagprovider() {
    fetchProfiles();
  }
  Future<void> fetchProfiles() async {
    setLoading(true);
    _tags = await _databaseHelper.fetchProfiles();

    setLoading(false);
    notifyListeners();
  }

  Future<void> addItem(TagSchema profile) async {
    setLoading(true);
    await _databaseHelper.insertProfile(profile);
    fetchProfiles();
    setLoading(false);
    _message = ' ';
    notifyListeners();
  }

  Future<void> updateItem(TagSchema profile) async {
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
    TagSchema? profile = await DatabaseHelper1.instance.fetchProfileById(id);
    if (profile != null) {
      Map<String, dynamic> updatedFields = profile.toMap();
      updatedFields[field] = value;
      TagSchema updatedProfile = TagSchema.fromMap(updatedFields);
      await DatabaseHelper1.instance.updateProfile(updatedProfile);
      setLoading(false);
      notifyListeners();
    }
    setLoading(false);
    notifyListeners();
  }
}
