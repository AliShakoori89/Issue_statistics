import 'dart:async';
import 'dart:io';
import 'package:issue_statistics/data/model/issue_model.dart';
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
  static const columnAllFanarIssueNumberPerDate = 'allFanarIssueNumberPerDate';
  static const columnAllIssueNumberPerDate = 'allIssueNumberNumber';

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  FutureOr<Database> get database async =>
      _database ??= await _initiateDatabase();

  _initiateDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  FutureOr _onCreate(Database db, int version) async {
    await db.execute('CREATE TABLE $issueTable ('
        '$columnId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,'
        '$columnIssueDate TEXT,'
        '$columnAllFanarIssueNumberPerDate INTEGER,'
        '$columnAllIssueNumberPerDate INTEGER'
        ')'
    );
  }

  FutureOr<bool> addNumberOfIssue(IssueModel issueModel) async {
    var dbExpense = await database;
    await dbExpense.insert(issueTable, issueModel.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return true;
  }

  FutureOr<String> readNumberOfIssuePerDate(String? date) async {

    var dbExpense = await database;
    var result = await dbExpense.rawQuery("SELECT $columnAllIssueNumberPerDate FROM $issueTable WHERE $columnIssueDate ='$date'");
    if(result.isEmpty) {
      return '0';
    }else{
      Object? value = result[result.length-1][columnAllIssueNumberPerDate];
      print("valueeeeeeeee                "+value.toString());
      if (value == null){
        return '0';
      }else{
        return "$value";
      }
    }
  }

  FutureOr<String> calculatePendarNumberOfIssue(String? date) async {
    var dbExpense = await database;
    var allIssues = await dbExpense.rawQuery("SELECT $columnAllIssueNumberPerDate FROM $issueTable WHERE $columnIssueDate ='$date'");
    Object? value1 = allIssues[allIssues.length-1][columnAllIssueNumberPerDate];
    var fanarCoNumberOfIssue = await dbExpense.rawQuery("SELECT $columnAllFanarIssueNumberPerDate FROM $issueTable WHERE $columnIssueDate ='$date'");
    Object? value2 = fanarCoNumberOfIssue[0][columnAllFanarIssueNumberPerDate];
    if (value1 == null){
      return '0';
    }else{
      var pendarCoNumberOfIssue = int.parse(value1.toString()) - int.parse(value2.toString());
      return "$pendarCoNumberOfIssue";
    }
  }
}