import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:issue_statistics/data/data_base/data_base.dart';
import 'package:issue_statistics/data/model/issue_model.dart';
import 'package:issue_statistics/presentation/networking/api_base_helper.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/model/all_issues_per_day_model.dart';

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

  // addNumberOfIssue(IssueModel issueModel) async {
  //   return await helper.addNumberOfIssue(issueModel);
  // }

  addNumberOfIssue(IssueModel issueModel) async {

    ApiBaseHelper api = ApiBaseHelper();

    var body = jsonEncode({'cnt': issueModel.allIssueNumber, 'persianDate': issueModel.issueDate,
      'year': issueModel.issueYear , 'month': issueModel.issueMonth});

    print("11111             "+body);

    final Uri address =
    Uri(host: "repb.raahbartrust.ir", scheme: "https", port: 8081, path: "/api/CaDashboard/AddCaDashboard");

    print("11111             "+address.toString());

    final response = await api.post(address, body: body, headers: {
      HttpHeaders.contentTypeHeader: 'application/json'});

    if(response.statusCode == 200 || response.statusCode == 201){
      return "success";
    }
    var parsedJson = json.decode(response.body);
    String message = parsedJson.values.elementAt(0);
    return message;
  }

  FutureOr<dynamic> fetchAllNumberOfIssuePerDate(String date) async {

    final queryParameters = {
      'PersianDate': date};

    final Uri address=
    Uri.https('repb.raahbartrust.ir:8081', '/api/CaDashboard/GetByPersianDate', queryParameters);

    var response = await api.post(address, headers: {
    HttpHeaders.contentTypeHeader: 'application/json'});

    print("###########################################################################");
    print(response.body);
    final productJson = json.decode(response.body);

    return AllIssuePerDayModel.fromJson(productJson);
  }

  FutureOr<String> readNumberOfIssueBetweenDays(String startDate, String endDate) async {
    final String allNumberOfIssue = await helper.readNumberOfIssuePerBetweenDays(startDate, endDate) ?? "";
    return allNumberOfIssue;
  }

}