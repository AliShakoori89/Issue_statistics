import 'dart:convert';
import 'package:issue_statistics/data/model/response_model.dart';
import '../../presentation/networking/api_base_helper.dart';


class NumberOfIssuesRepository {

  Future<List<ResponseModel>> getNumberOfIssues(String reportKey, String customerCode) async {
    ApiBaseHelper api = ApiBaseHelper();
    print("4444444444444");
    var body = jsonEncode({"reportkey":"4b8ngUfvEnA/4AiSB76+kqz2Ztk=","customercode":"10320874334","startdate":"2023/10/27","enddate":"2023/10/27","type":"PerCA"});

    print("555555555555");
    print("body            "+body);
    final response = await api.post("https://api.raahbartrust.ir/api/IssuingReport", body);
    print("response            "+response);
    final productJson = json.decode(response.body);
    print("productJson            "+productJson);

    return jsonDecode(response.body);
  }
}