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

  Future<String> getFarvardinRAIssuePerYear(String year) async{
    var dbIssue = await database;
    print("dbIssue                  "+year);
    var farvardin = await dbIssue.rawQuery("SELECT SUM($columnAllIssueNumberPerDate) FROM $issueTable WHERE $columnIssueYear = $year AND $columnIssueMonth = 1");
    // int farvardin = (await dbIssue.rawQuery("SELECT SUM($columnAllIssueNumberPerDate) FROM $issueTable WHERE $columnIssueYear ='$year'")) as int;
    print("farvardin      "+farvardin.toString());
    if(farvardin.isEmpty) {
      return '0';
    }else{
      Object? value = farvardin[0]["SUM($columnAllIssueNumberPerDate)"];
      if (value == null){
        return '0';
      }else{
        return "$value";
      }
    }
  }

  Future<String> getOrdibeheshtRAIssuePerYear(String year) async{
    var dbIssue = await database;
    var ordibehesht = await dbIssue.rawQuery("SELECT SUM($columnAllIssueNumberPerDate) FROM $issueTable WHERE $columnIssueYear ='$year' AND $columnIssueMonth = 2");
    print("ordibehesht      "+ordibehesht.toString());
    if(ordibehesht.isEmpty) {
      return '0';
    }else{
      Object? value = ordibehesht[0]["SUM($columnAllIssueNumberPerDate)"];
      if (value == null){
        return '0';
      }else{
        return "$value";
      }
    }
  }

  Future<String> getKhordadRAIssuePerYear(String year) async{
    var dbIssue = await database;
    var khordad = await dbIssue.rawQuery("SELECT SUM($columnAllIssueNumberPerDate) FROM $issueTable WHERE $columnIssueYear ='$year' AND $columnIssueMonth = 3");
    print("khordad      "+khordad.toString());
    if(khordad.isEmpty) {
      return '0';
    }else{
      Object? value = khordad[0]["SUM($columnAllIssueNumberPerDate)"];
      if (value == null){
        return '0';
      }else{
        return "$value";
      }
    }
  }

  Future<String> getTirRAIssuePerYear(String year) async{
    var dbIssue = await database;
    var tir = await dbIssue.rawQuery("SELECT SUM($columnAllIssueNumberPerDate) FROM $issueTable WHERE $columnIssueYear ='$year' AND $columnIssueMonth = 4");
    print("tir      "+tir.toString());
    if(tir.isEmpty) {
      return '0';
    }else{
      Object? value = tir[0]["SUM($columnAllIssueNumberPerDate)"];
      if (value == null){
        return '0';
      }else{
        return "$value";
      }
    }
  }

  Future<String> getMordadRAIssuePerYear(String year) async{
    var dbIssue = await database;
    var mordad = await dbIssue.rawQuery("SELECT SUM($columnAllIssueNumberPerDate) FROM $issueTable WHERE $columnIssueYear ='$year' AND $columnIssueMonth = 5");
    print("mordad      "+mordad.toString());
    if(mordad.isEmpty) {
      return '0';
    }else{
      Object? value = mordad[0]["SUM($columnAllIssueNumberPerDate)"];
      if (value == null){
        return '0';
      }else{
        return "$value";
      }
    }
  }

  Future<String> getShahrivarRAIssuePerYear(String year) async{
    var dbIssue = await database;
    var shahrivar = await dbIssue.rawQuery("SELECT SUM($columnAllIssueNumberPerDate) FROM $issueTable WHERE $columnIssueYear ='$year' AND $columnIssueMonth = 6");
    print("shahrivar      "+shahrivar.toString());
    if(shahrivar.isEmpty) {
      return '0';
    }else{
      Object? value = shahrivar[0]["SUM($columnAllIssueNumberPerDate)"];
      if (value == null){
        return '0';
      }else{
        return "$value";
      }
    }
  }

  Future<String> getMehrRAIssuePerYear(String year) async{
    var dbIssue = await database;
    var mehr = await dbIssue.rawQuery("SELECT SUM($columnAllIssueNumberPerDate) FROM $issueTable WHERE $columnIssueYear ='$year' AND $columnIssueMonth = 7");
    print("mehr      "+mehr.toString());
    if(mehr.isEmpty) {
      return '0';
    }else{
      Object? value = mehr[0]["SUM($columnAllIssueNumberPerDate)"];
      if (value == null){
        return '0';
      }else{
        return "$value";
      }
    }
  }

  Future<String> getAbanRAIssuePerYear(String year) async{
    var dbIssue = await database;
    var aban = await dbIssue.rawQuery("SELECT SUM($columnAllIssueNumberPerDate) FROM $issueTable WHERE $columnIssueYear ='$year' AND $columnIssueMonth = 8");
    print("aban      "+aban.toString());
    if(aban.isEmpty) {
      return '0';
    }else{
      Object? value = aban[0]["SUM($columnAllIssueNumberPerDate)"];
      if (value == null){
        return '0';
      }else{
        return "$value";
      }
    }
  }

  Future<String> getAzarRAIssuePerYear(String year) async{
    var dbIssue = await database;
    var azar = await dbIssue.rawQuery("SELECT SUM($columnAllIssueNumberPerDate) FROM $issueTable WHERE $columnIssueYear ='$year' AND $columnIssueMonth = 9");
    print("azar      "+azar.toString());
    if(azar.isEmpty) {
      return '0';
    }else{
      Object? value = azar[0]["SUM($columnAllIssueNumberPerDate)"];
      if (value == null){
        return '0';
      }else{
        return "$value";
      }
    }
  }

  Future<String> getDeyRAIssuePerYear(String year) async{
    var dbIssue = await database;
    var dey = await dbIssue.rawQuery("SELECT SUM($columnAllIssueNumberPerDate) FROM $issueTable WHERE $columnIssueYear ='$year' AND $columnIssueMonth = 10");
    print("dey      "+dey.toString());
    if(dey.isEmpty) {
      return '0';
    }else{
      Object? value = dey[0]["SUM($columnAllIssueNumberPerDate)"];
      if (value == null){
        return '0';
      }else{
        return "$value";
      }
    }
  }

  Future<String> getBahmanRAIssuePerYear(String year) async{
    var dbIssue = await database;
    var bahman = await dbIssue.rawQuery("SELECT SUM($columnAllIssueNumberPerDate) FROM $issueTable WHERE $columnIssueYear ='$year' AND $columnIssueMonth = 11");
    print("bahman      "+bahman.toString());
    if(bahman.isEmpty) {
      return '0';
    }else{
      Object? value = bahman[0]["SUM($columnAllIssueNumberPerDate)"];
      if (value == null){
        return '0';
      }else{
        return "$value";
      }
    }
  }

  Future<String> getEsfandRAIssuePerYear(String year) async{
    var dbIssue = await database;
    var esfand = await dbIssue.rawQuery("SELECT SUM($columnAllIssueNumberPerDate) FROM $issueTable WHERE $columnIssueYear ='$year' AND $columnIssueMonth = 12");
    print("esfand      "+esfand.toString());
    if(esfand.isEmpty) {
      return '0';
    }else{
      Object? value = esfand[0]["SUM($columnAllIssueNumberPerDate)"];
      if (value == null){
        return '0';
      }else{
        return "$value";
      }
    }
  }
}