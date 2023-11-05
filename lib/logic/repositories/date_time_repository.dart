import 'package:shamsi_date/shamsi_date.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SetDateRepository {

  // initialDate() async{
  //   final prefs = await SharedPreferences.getInstance();
  //   String dateMonthString = Jalali.now().month.toString().length != 1
  //       ? '${Jalali.now().year}-${Jalali.now().month}'
  //       : '${Jalali.now().year}-0${Jalali.now().month}';
  //   String dateString = Jalali.now().month.toString().length != 1 && Jalali.now().day.toString().length != 1
  //       ? '${Jalali.now().year}-${Jalali.now().month}-${Jalali.now().day}'
  //       : Jalali.now().month.toString().length != 1 && Jalali.now().day.toString().length == 1
  //       ? '${Jalali.now().year}-${Jalali.now().month}-0${Jalali.now().day}'
  //       : Jalali.now().month.toString().length == 1 && Jalali.now().day.toString().length != 1
  //       ? '${Jalali.now().year}-0${Jalali.now().month}-${Jalali.now().day}'
  //       : '${Jalali.now().year}-0${Jalali.now().month}-0${Jalali.now().day}';
  //   await prefs.setString('dateMonth', dateMonthString);
  //   await prefs.setString('date', dateString);
  // }


  // writeDate(String date , String month) async{
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('date', date);
  //   await prefs.setString('dateMonth', month);
  // }
  //
  reduceDate(String date, String month) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('date', date);
    await prefs.setString('dateMonth', month);
  }
  //
  // Future<String> readMonth() async{
  //   final prefs = await SharedPreferences.getInstance();
  //   final String? dateMonth = prefs.getString('dateMonth');
  //   if(dateMonth == ""){
  //     String monthString = '${Jalali.now().year}-${Jalali.now().month}';
  //     return monthString;
  //   }else{
  //     return dateMonth!;
  //   }
  // }
  //
  // Future<String> readDate() async{
  //   final prefs = await SharedPreferences.getInstance();
  //   final String? date = prefs.getString('date');
  //   if(date == ""){
  //     String dateString = '${Jalali.now().year}-${Jalali.now().month}-${Jalali.now().day}';
  //     return dateString;
  //   }else{
  //     return date!;
  //   }
  // }
  //
  addToDate(String date, String month) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('date', date);
    await prefs.setString('dateMonth', month);
  }

  Future<int> calculatePendarNumberOfIssueAndSum(String date, int allIssue)async{
    print("calculatePendarNumberOfIssueAndSum                   "+date+"            "+ allIssue.toString());
    final prefs = await SharedPreferences.getInstance();

    final int? pendarIssueNumber = prefs.getInt('WritePendarAllNumberOfIssues$date');
    final int? fanarIssueNumber = prefs.getInt('WriteFanarAllNumberOfIssues$date');

    int pendarIssue = allIssue - (pendarIssueNumber! + fanarIssueNumber!);
    print("88888888888888888888888            "+pendarIssue.toString());

    return pendarIssue;
  }

  saveAllIssuePerDate(String date, int allIssuePerDate) async{
    print("saveAllIssuePerDate                   "+date+"            "+ allIssuePerDate.toString());
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('AllNumberOfIssues$date', allIssuePerDate);
  }

  Future<int?> readAllIssuePerDateNumber(String date) async{
    print("readAllIssuePerDateNumber                   "+date+"            AllNumberOfIssues$date");
    final prefs = await SharedPreferences.getInstance();
    int? allIssuePerDateNumber = prefs.getInt('AllNumberOfIssues$date');
    print("9999999999999999            "+allIssuePerDateNumber.toString());
    return allIssuePerDateNumber;
  }
  // Future<List<ExpenseModel>> getAllExpensesItemsRepo(String date) async {
  //   return await helper.getAllExpensesItems(date);
  // }
}