import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class TodoRepository {
  TodoRepository._privateConstructor();
  static final TodoRepository instance = TodoRepository._privateConstructor();

  final tableName = "TODO";
  final identityColumn = "id";
  final textColumn = "text";
  final dateColumn = "date";
  final _version = 2;
  Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initializeDatabase();
    return _database;
  }

  _initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "todo.db");
    return await openDatabase(path, version: _version, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $tableName(
          $identityColumn INTEGER PRIMARY KEY,
          $textColumn TEXT NOT NULL,
          $dateColumn TEXT NOT NULL)
      ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(tableName, row);
  }

  Future delete(String id) async {
    Database db = await instance.database;
    await db
        .delete("$tableName", where: '$identityColumn = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> getAll() async {
    Database db = await instance.database;
    return await db.query(tableName);
  }

  Future<List<Map<String, dynamic>>> getById(int id) async {
    Database db = await instance.database;
    return await db
        .query(tableName, where: '$identityColumn =?', whereArgs: [id]);
  }
}
