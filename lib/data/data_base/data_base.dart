import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper();

  static const _databaseName = "MyDatabase.db";
  static const _databaseVersion = 1;

  static const issueTable = 'issueTable';
  static const columnId = 'id';
  static const columnIssueDate = 'issueDate';
  static const columnIssueMonth = 'issueMonth';
  static const columnIssueNumber = 'issueNumber';

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async =>
      _database ??= await _initiateDatabase();

  _initiateDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('CREATE TABLE $issueTable ('
        '$columnId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,'
        '$columnIssueDate TEXT,'
        '$columnIssueMonth TEXT,'
        '$columnIssueNumber TEXT'
        ')'
    );
  }

//******************************************************************************

}