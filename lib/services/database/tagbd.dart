import 'package:sqflite/sqflite.dart';
import 'package:touchsync/services/database/schemas/tag.schema.dart';
import 'package:path/path.dart';

class DatabaseHelper1 {
  static final DatabaseHelper1 instance = DatabaseHelper1._internal();
  factory DatabaseHelper1() => instance;
  DatabaseHelper1._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'tagdbs.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE tagdbs(
        id TEXT PRIMARY KEY,
        name TEXT,
        location TEXT,
        phoneNumber TEXT,
        email TEXT,
        urls TEXT,
        jobTitle TEXT,
        company TEXT
      )
    ''');
  }

  Future<int> insertProfile(TagSchema profile) async {
    Database db = await instance.database;
    return await db.insert('tagdbs', profile.toMap());
  }

  Future<List<TagSchema>> fetchProfiles() async {
    Database db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query('tagdbs');
    return List.generate(maps.length, (i) {
      return TagSchema.fromMap(maps[i]);
    });
  }

  Future<int> updateProfile(TagSchema profile) async {
    Database db = await instance.database;
    return await db.update(
      'tagdbs',
      profile.toMap(),
      where: 'id = ?',
      whereArgs: [profile.id],
    );
  }

  Future<int> deleteProfile(String id) async {
    Database db = await instance.database;
    return await db.delete(
      'tagdbs',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<TagSchema?> fetchProfileById(String id) async {
    Database db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'tagdbs',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      print(maps.first);
      return TagSchema.fromMap(maps.first);
    } else {
      return null;
    }
  }
}
