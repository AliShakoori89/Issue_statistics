import 'dart:convert';
import '../../presentation/networking/api_base_helper.dart';


class NumberOfIssuesRepository {

  ApiBaseHelper api = ApiBaseHelper();

  Future<dynamic> getNumberOfIssues(String reportKey, String customerCode) async {
    print("8888888888888888");
    var body = jsonEncode({"reportkey":"4b8ngUfvEnA/4AiSB76+kqz2Ztk=","customercode":"10320874334","startdate":"2023/10/27","enddate":"2023/10/27","type":"PerCA"});
    print("99999999999999999999");
    var response = await api.post("https://api.raahbartrust.ir/api/IssuingReport", body);
    print("10 10 10 10 10 10 10 10");
    print("11 11 11 11 11 11 11 11                         "+response);
    return response;
  }
}