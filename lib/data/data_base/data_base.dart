import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper();

  static const _databaseName = "MyDatabase.db";
  static const _databaseVersion = 1;

  static const expenseTable = 'expenseTable';
  static const columnExpenseId = 'id';
  static const columnExpenseDate = 'expenseDate';
  static const columnExpenseMonth = 'expenseMonth';
  static const columnExpenseCategory = 'expenseCategory';
  static const columnExpense = 'expense';
  static const columnExpenseDescription = 'expenseDescription';
  static const columnExpenseIconType = 'expenseIconType';

  static const incomeTable = 'incomeTable';
  static const columnIncomeId = 'id';
  static const columnIncomeDate = 'incomeDate';
  static const columnIncomeMonth = 'incomeMonth';
  static const columnIncomeCategory = "incomeCategory";
  static const columnIncome = "income";
  static const columnIncomeDescription = "incomeDescription";
  static const columnIncomeIconType = "incomeIconType";


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
    await db.execute('CREATE TABLE $expenseTable ('
        '$columnExpenseId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,'
        '$columnExpenseDate TEXT,'
        '$columnExpenseMonth TEXT,'
        '$columnExpenseCategory TEXT,'
        '$columnExpense INTEGER,'
        '$columnExpenseDescription TEXT,'
        '$columnExpenseIconType TEXT'
        ')'
    );

    await db.execute('CREATE TABLE $incomeTable ('
        '$columnIncomeId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,'
        '$columnIncomeDate TEXT,'
        '$columnIncomeMonth TEXT,'
        '$columnIncomeCategory TEXT,'
        '$columnIncome INTEGER,'
        '$columnIncomeDescription TEXT,'
        '$columnIncomeIconType TEXT'
        ')'
    );
  }

//******************************************************************************

}