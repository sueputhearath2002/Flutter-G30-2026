import 'package:flutter2026/Assignment/A/model/person_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  //Called a singleton pattern

  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB("users.db");
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbpath = await getDatabasesPath();
    String path = join(dbpath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE users (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      email TEXT,
      avatar TEXT
    )
    ''');
  }

  Future<int> insertUser(PersonModel user) async {
    final db = await instance.database;
    return await db.insert("users", user.toMap());
  }

  Future<List<PersonModel>> getUers() async {
    final db = await instance.database;
    final result = await db.query("users");
    return result.map((json) => PersonModel.fromJson(json)).toList();
  }

  Future<int> updateUser(PersonModel user) async {
    final db = await instance.database;
    return await db.update(
      "users",
      user.toMap(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  Future<int> deleteUser(int id) async {
    final db = await instance.database;
    return await db.delete("users", where: 'id = ?', whereArgs: [id]);
  }
}
