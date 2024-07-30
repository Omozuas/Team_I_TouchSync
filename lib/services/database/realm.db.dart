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
    String path = join(await getDatabasesPath(), 'profiles.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE profiles(
        id TEXT PRIMARY KEY,
        userName TEXT,
        surName TEXT,
        otherName TEXT,
        location TEXT,
        phoneNumber TEXT,
        email TEXT,
        messanger TEXT,
        whatsapp TEXT,
        telegram TEXT,
        tiktok TEXT,
        paypal TEXT,
        youtube TEXT,
        facebook TEXT,
        snapchat TEXT,
        zoomMeeting TEXT,
        teams TEXT,
        notion TEXT
      )
    ''');
  }

  Future<int> insertProfile(ProfileSchema profile) async {
    Database db = await instance.database;
    return await db.insert('profiles', profile.toMap());
  }

  Future<List<ProfileSchema>> fetchProfiles() async {
    Database db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query('profiles');
    return List.generate(maps.length, (i) {
      return ProfileSchema.fromMap(maps[i]);
    });
  }

  Future<int> updateProfile(ProfileSchema profile) async {
    Database db = await instance.database;
    return await db.update(
      'profiles',
      profile.toMap(),
      where: 'id = ?',
      whereArgs: [profile.id],
    );
  }

  Future<int> deleteProfile(String id) async {
    Database db = await instance.database;
    return await db.delete(
      'profiles',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<ProfileSchema?> fetchProfileById(String id) async {
    Database db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'profiles',
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
}
