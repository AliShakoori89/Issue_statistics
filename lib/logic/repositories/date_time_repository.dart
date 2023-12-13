import 'dart:async';
import 'dart:convert';

import 'package:issue_statistics/data/data_base/data_base.dart';
import 'package:issue_statistics/data/model/issue_model.dart';
import 'package:issue_statistics/presentation/networking/api_base_helper.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SetDateRepository {

  late final DatabaseHelper helper;
  ApiBaseHelper api = ApiBaseHelper();

  SetDateRepository() {
    helper = DatabaseHelper();
  }

  initialDate() async{
    final prefs = await SharedPreferences.getInstance();
    String dateMonthString = Jalali.now().month.toString().length != 1
        ? '${Jalali.now().year}-${Jalali.now().month}'
        : '${Jalali.now().year}-0${Jalali.now().month}';
    String dateString = Jalali.now().month.toString().length != 1 && Jalali.now().day.toString().length != 1
        ? '${Jalali.now().year}-${Jalali.now().month}-${Jalali.now().day}'
        : Jalali.now().month.toString().length != 1 && Jalali.now().day.toString().length == 1
        ? '${Jalali.now().year}-${Jalali.now().month}-0${Jalali.now().day}'
        : Jalali.now().month.toString().length == 1 && Jalali.now().day.toString().length != 1
        ? '${Jalali.now().year}-0${Jalali.now().month}-${Jalali.now().day}'
        : '${Jalali.now().year}-0${Jalali.now().month}-0${Jalali.now().day}';
    await prefs.setString('dateMonth', dateMonthString);
    await prefs.setString('date', dateString);
  }

  writeDate(String date , String month) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('date', date);
    await prefs.setString('dateMonth', month);
  }
  //
  reduceDate(String date, String month) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('date', date);
    await prefs.setString('dateMonth', month);
  }

  FutureOr<String> readDate() async{
    final prefs = await SharedPreferences.getInstance();
    final String? date = prefs.getString('date');
    if(date == ""){
      String dateString = '${Jalali.now().year}-${Jalali.now().month}-${Jalali.now().day}';
      return dateString;
    }else{
      return date!;
    }
  }

  addToDate(String date, String month) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('date', date);
    await prefs.setString('dateMonth', month);
  }

  addNumberOfIssue(IssueModel issueModel) async {
    return await helper.addNumberOfIssue(issueModel);
  }

  // FutureOr<String> readNumberOfIssuePerDate(String date) async {
  //   final String allNumberOfIssue = await helper.readNumberOfIssuePerDate(date) ?? "";
  //   return allNumberOfIssue;
  // }
  FutureOr<dynamic> fetchAllNumberOfIssuePerDate(String date) async {

    print("BBBloc           "+date);

    // DateTime g = DateTime.parse(date);
    // Jalali j = Jalali(g.year, g.month, g.day);
    // Gregorian j2g1 = j.toGregorian();
    //
    // String gregorianDate = "${j2g1.year}/${j2g1.month}/${j2g1.day}";

    var body = jsonEncode({"PersianDate":"1402/07/10"});
    print("#################################################################################################           ");

    final Uri address =
    Uri.parse("https://repb.raahbartrust.ir:8081/api/CaDashboard/GetByPersianDate");

    // final uri =
    // Uri.https("repb.raahbartrust.ir:8081/api/CaDashboard/GetByPersianDate", "", queryParameters);

    // print("@@@@@@@@@@@@@@@@@@@@@@@@"+uri.toString());

    var response = await api.post(address,body: body);
    return response;
  }

  FutureOr<String> readNumberOfIssueBetweenDays(String startDate, String endDate) async {
    final String allNumberOfIssue = await helper.readNumberOfIssuePerBetweenDays(startDate, endDate) ?? "";
    return allNumberOfIssue;
  }

}