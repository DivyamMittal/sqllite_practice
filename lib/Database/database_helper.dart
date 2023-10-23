import "dart:io";
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import "package:sqflite/sqflite.dart";

class DatabaseHelper extends ChangeNotifier {
  static final DatabaseHelper instance = DatabaseHelper();

  // database initialize
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "newslist.db");
    return await openDatabase(path, version: 1, onCreate: onCreate);
  }

  Future onCreate(Database db, int version) async {
    db.execute('''
      CREATE TABLE newstable(
        id INTEGER Unique NOT NULL,
        title TEXT ,
        content TEXT ,
        imageUrl TEXT ,
        date TEXT ,
        tag TEXT 
      )
    ''');
  }

  // insert method
  insert(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db
        ?.insert("newstable", row, conflictAlgorithm: ConflictAlgorithm.replace)
        .then((value) {
      notifyListeners();
    });
  }

  // get method
  Future<List<Map<String, dynamic>>?> getDataDB() async {
    Database? db = await instance.database;
    return await db?.query("newstable");
  }

  // update method
  Future<int?> updateRecord(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db
        ?.update("newstable", row, where: "id= ?", whereArgs: [row['id']]);
  }

  // delete method
  Future<int?> deleteRecord(int id) async {
    Database? db = await instance.database;
    return await db?.delete("newstable", where: 'id = ?', whereArgs: [id]);
  }
}
