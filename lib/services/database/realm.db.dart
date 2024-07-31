import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'schemas/profie.schema.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._internal();
  factory DatabaseHelper() => instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'profiledbs.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE profiledbs(
        id TEXT PRIMARY KEY,
        userName TEXT,
        surName TEXT,
        otherName TEXT,
        location TEXT,
        phoneNumber TEXT,
        email TEXT,
        messenger TEXT,
        whatsapp TEXT,
        telegram TEXT,
        tiktok TEXT,
        paypal TEXT,
        youtube TEXT,
        facebook TEXT,
        instagram TEXT,
        zoom TEXT,
        teams TEXT,
        notion TEXT,
        appStore TEXT
      )
    ''');
  }

  Future<int> insertProfile(ProfileSchema profile) async {
    Database db = await instance.database;
    return await db.insert('profiledbs', profile.toMap());
  }

  Future<List<ProfileSchema>> fetchProfiles() async {
    Database db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query('profiledbs');
    return List.generate(maps.length, (i) {
      return ProfileSchema.fromMap(maps[i]);
    });
  }

  Future<int> updateProfile(ProfileSchema profile) async {
    Database db = await instance.database;
    return await db.update(
      'profiledbs',
      profile.toMap(),
      where: 'id = ?',
      whereArgs: [profile.id],
    );
  }

  Future<int> deleteProfile(String id) async {
    Database db = await instance.database;
    return await db.delete(
      'profiledbs',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<ProfileSchema?> fetchProfileById(String id) async {
    Database db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'profiledbs',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      print(maps.first);
      return ProfileSchema.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<Map<String, dynamic>> getSocialMediaLinksById(String id) async {
    Database db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'profiledbs',
      columns: [
        'messenger',
        'whatsapp',
        'telegram',
        'tiktok',
        'paypal',
        'youtube',
        'facebook',
        'instagram',
        'zoom',
        'teams',
        'notion',
        'appStore'
      ],
      where: 'id = ?',
      whereArgs: [id],
    );

    Map<String, bool> socialMediaStatus = {
      'messenger': false,
      'whatsapp': false,
      'telegram': false,
      'tiktok': false,
      'paypal': false,
      'youtube': false,
      'facebook': false,
      'instagram': false,
      'zoom': false,
      'teams': false,
      'notion': false,
      'appStore': false,
    };

    int filledCount = 0;

    if (maps.isNotEmpty) {
      final profile = maps.first;
      profile.forEach((key, value) {
        if (value != null && value.isNotEmpty) {
          socialMediaStatus[key] = true;
          filledCount++;
        }
      });
    }

    return {'socialMediaStatus': socialMediaStatus, 'filledCount': filledCount};
  }
}
