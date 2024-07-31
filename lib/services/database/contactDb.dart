import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:touchsync/services/database/schemas/contact.schema.dart';

class ContactDatabaseHelper {
  static final ContactDatabaseHelper instance =
      ContactDatabaseHelper._internal();
  factory ContactDatabaseHelper() => instance;
  ContactDatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'contacts.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE contacts(
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
        notion TEXT,
        day TEXT,
        time TEXT,
        texts Text
      )
    ''');
  }

  Future<int> insertProfile(ContactSchema profile) async {
    Database db = await instance.database;
    return await db.insert('contacts', profile.toMap());
  }

  Future<List<ContactSchema>> fetchProfiles(
      {String? filter, String? sortBy, bool ascending = true}) async {
    Database db = await instance.database;
    // Building the WHERE clause for filtering
    String? whereClause;
    List<String>? whereArgs;
    if (filter != null && filter.isNotEmpty) {
      whereClause = '(userName LIKE ? OR email LIKE ?)';
      whereArgs = ['%$filter%', '%$filter%'];
    }

    // Building the ORDER BY clause for sorting
    String? orderBy;
    if (sortBy != null) {
      orderBy = '$sortBy ${ascending ? 'ASC' : 'DESC'}';
    }
    final List<Map<String, dynamic>> maps = await db.query(
      'contacts',
      where: whereClause,
      whereArgs: whereArgs,
      orderBy: orderBy,
    );
    return List.generate(maps.length, (i) {
      return ContactSchema.fromMap(maps[i]);
    });
  }

  Future<List<ContactSchema>> fetchRecentContacts(
      {String? sortBy, bool ascending = false}) async {
    Database db = await instance.database;

    // Default sorting by recently added time in descending order
    String defaultSortBy = 'time';
    String orderBy = defaultSortBy;

    // If a specific sortBy is provided, override the default sorting
    if (sortBy != null && sortBy.isNotEmpty) {
      orderBy = '$sortBy ${ascending ? 'ASC' : 'DESC'}';
    }

    // Adding limit clause to the query
    final List<Map<String, dynamic>> maps = await db.query(
      'contacts',
      orderBy: orderBy,
      limit: 12,
    );

    // Debugging step
    print('Fetched ${maps.length} contacts');

    return List.generate(maps.length, (i) {
      return ContactSchema.fromMap(maps[i]);
    });
  }

  Future<List<ContactSchema>> fetchRecentContacts24(
      {String? sortBy, bool ascending = false}) async {
    Database db = await instance.database;

    // Default sorting by recently added time in descending order
    String defaultSortBy = 'time';
    String orderBy = defaultSortBy;

    // If a specific sortBy is provided, override the default sorting
    if (sortBy != null && sortBy.isNotEmpty) {
      orderBy = '$sortBy ${ascending ? 'ASC' : 'DESC'}';
    }

    // Adding limit clause to the query
    final List<Map<String, dynamic>> maps = await db.query(
      'contacts',
      orderBy: orderBy,
    );

    // Debugging step
    print('Fetched ${maps.length} contacts');

    return List.generate(maps.length, (i) {
      return ContactSchema.fromMap(maps[i]);
    });
  }

  Future<int> updateProfile(ContactSchema profile) async {
    Database db = await instance.database;
    return await db.update(
      'contacts',
      profile.toMap(),
      where: 'id = ?',
      whereArgs: [profile.id],
    );
  }

  Future<int> deleteProfile(String id) async {
    Database db = await instance.database;
    return await db.delete(
      'contacts',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<ContactSchema?> fetchProfileById(String id) async {
    Database db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'contacts',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      print(maps.first);
      return ContactSchema.fromMap(maps.first);
    } else {
      return null;
    }
  }
}
