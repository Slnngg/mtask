import 'package:mtest_app/model/auth_user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'auth.db');

    // await deleteDatabase(path); // Remove in production

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE user(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            phone TEXT,
            password TEXT,
            email TEXT,
            address TEXT,
            city TEXT,
            postCode TEXT,
            fullName TEXT,
            userName TEXT,
            dateOfBirth TEXT,
            selectedCountry TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertUser(AuthUserModel user) async {
    final db = await database;
    await db.insert('user', user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<AuthUserModel>> getUsers() async {
    final db = await database;
    final maps = await db.query('user');
    return maps.map((e) => AuthUserModel.fromMap(e)).toList();
  }

  Future<AuthUserModel?> getUserByPhoneAndPassword(
      String phone, String password) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'user',
      where: 'phone = ? AND password = ?',
      whereArgs: [phone, password],
    );

    if (maps.isNotEmpty) {
      return AuthUserModel.fromMap(maps.first);
    } else {
      return null;
    }
  }
}
