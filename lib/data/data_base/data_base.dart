import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
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
  static const columnIssueMonth = 'issueMonth';
  static const columnIssueYear = 'issueYear';
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
        '$columnIssueMonth TEXT,'
        '$columnIssueYear TEXT,'
        '$columnAllFanarIssueNumberPerDate INTEGER,'
        '$columnAllIssueNumberPerDate INTEGER'
        ')'
    );
  }

  FutureOr<bool> addNumberOfIssue(IssueModel issueModel) async {
    var dbIssue = await database;
    await dbIssue.insert(issueTable, issueModel.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return true;
  }

  FutureOr<String> readNumberOfIssuePerDate(String? date) async {

    var dbIssue = await database;
    var result = await dbIssue.rawQuery("SELECT $columnAllIssueNumberPerDate FROM $issueTable WHERE $columnIssueDate ='$date'");
    if(result.isEmpty) {
      return '0';
    }else{
      Object? value = result[result.length-1][columnAllIssueNumberPerDate];
      if (value == null){
        return '0';
      }else{
        return "$value";
      }
    }
  }

  FutureOr<String> readNumberOfIssuePerBetweenDays(String? startDate, String? endDate) async {

    var dbIssue = await database;
    var result = await dbIssue.rawQuery("SELECT SUM($columnAllIssueNumberPerDate) FROM $issueTable WHERE $columnIssueDate BETWEEN '$startDate' AND '$endDate'");

    if(result.isEmpty) {
      return '0';
    }else{
      Object? value = result[0]["SUM($columnAllIssueNumberPerDate)"];
      if (value == null){
        return '0';
      }else{
        return "$value";
      }
    }
  }

  FutureOr<String> calculatePendarNumberOfIssue(String? date) async {
    var dbIssue = await database;
    var allIssues = await dbIssue.rawQuery("SELECT $columnAllIssueNumberPerDate FROM $issueTable WHERE $columnIssueDate ='$date'");
    Object? value1 = allIssues[allIssues.length-1][columnAllIssueNumberPerDate];
    var fanarCoNumberOfIssue = await dbIssue.rawQuery("SELECT $columnAllFanarIssueNumberPerDate FROM $issueTable WHERE $columnIssueDate ='$date'");
    Object? value2 = fanarCoNumberOfIssue[0][columnAllFanarIssueNumberPerDate];
    if (value1 == null){
      return '0';
    }else{
      var pendarCoNumberOfIssue = int.parse(value1.toString()) - int.parse(value2.toString());
      return "$pendarCoNumberOfIssue";
    }
  }

  Future<List<Map<String, Object?>>> getMonthlyRAIssuePerYear(String year) async{
    var dbIssue = await database;
    print("Date Year                     "+columnIssueDate );
    var farvardin = await dbIssue.rawQuery("SELECT $columnAllIssueNumberPerDate FROM $issueTable WHERE $columnIssueYear ='$year' AND $columnIssueMonth = 1");
    var ordibehesht = await dbIssue.rawQuery("SELECT $columnAllIssueNumberPerDate FROM $issueTable WHERE $columnIssueYear ='$year' AND $columnIssueMonth = 2");
    var khordad = await dbIssue.rawQuery("SELECT $columnAllIssueNumberPerDate FROM $issueTable WHERE $columnIssueYear ='$year' AND $columnIssueMonth = 3");
    var tir = await dbIssue.rawQuery("SELECT $columnAllIssueNumberPerDate FROM $issueTable WHERE $columnIssueYear ='$year' AND $columnIssueMonth = 4");
    var mordad = await dbIssue.rawQuery("SELECT $columnAllIssueNumberPerDate FROM $issueTable WHERE $columnIssueYear ='$year' AND $columnIssueMonth = 5");
    var shahrivar = await dbIssue.rawQuery("SELECT $columnAllIssueNumberPerDate FROM $issueTable WHERE $columnIssueYear ='$year' AND $columnIssueMonth = 6");
    var mehr = await dbIssue.rawQuery("SELECT $columnAllIssueNumberPerDate FROM $issueTable WHERE $columnIssueYear ='$year' AND $columnIssueMonth = 7");
    var aban = await dbIssue.rawQuery("SELECT $columnAllIssueNumberPerDate FROM $issueTable WHERE $columnIssueYear ='$year' AND $columnIssueMonth = 8");
    var azar = await dbIssue.rawQuery("SELECT $columnAllIssueNumberPerDate FROM $issueTable WHERE $columnIssueYear ='$year' AND $columnIssueMonth = 9");
    var dey = await dbIssue.rawQuery("SELECT $columnAllIssueNumberPerDate FROM $issueTable WHERE $columnIssueYear ='$year' AND $columnIssueMonth = 10");
    var bahman = await dbIssue.rawQuery("SELECT $columnAllIssueNumberPerDate FROM $issueTable WHERE $columnIssueYear ='$year' AND $columnIssueMonth = 11");
    var esfand = await dbIssue.rawQuery("SELECT $columnAllIssueNumberPerDate FROM $issueTable WHERE $columnIssueYear ='$year' AND $columnIssueMonth = 12");

    return farvardin;
  }
}