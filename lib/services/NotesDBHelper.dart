import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class NoteDBHelper {
  static const dbname = 'notes.db';
  static const dbversion = 1;
  static const tablename = 'notes';
  static const colid = 'id';
  static const coltittle = 'tittle';
  static const coldescription = 'description';
  static const coldate = 'date';

  static final NoteDBHelper instance = NoteDBHelper();
  static Database? mohsinillahi;

  Future<Database?> get db async {
    mohsinillahi ??= await _initDb();
    return mohsinillahi;
  }

  _initDb() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, dbname);
    return openDatabase(path, version: dbversion, onCreate: _onCreate);
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $tablename(
      $colid INTEGER PRIMARY KEY AUTOINCREMENT,
      $coltittle TEXT NOT NULL,
      $coldescription TEXT NOT NULL,
      $coldate TEXT NOT NULL
    )
''');
  }

  //========INSERT UPDATE VIEW DELETE INDIVIDUALLY========//

  //Insert
  Future<int> insert(Map<String, dynamic> row) async {
    Database? db = await instance.db;
    return await db!.insert(tablename, row);
  }

//Read
  Future<List<Map<String, dynamic>>> queryAll() async {
    Database? db = await instance.db;
    return await db!.query(tablename);
  }

  //update
  Future<int> update(Map<String, dynamic> row) async {
    Database? db = await instance.db;
    int id = row[colid];
    return await db!
        .update(tablename, row, where: '$colid = ?', whereArgs: [id]);
  }

  //delete
  Future<int> delete(int id) async {
    Database? db = await instance.db;
    return await db!.delete(tablename, where: '$colid =?', whereArgs: [id]);
  }

  //close
  Future close() async {
    Database? db = await instance.db;
    db!.close();
  }
}
