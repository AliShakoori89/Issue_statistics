import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'http_exception.dart';

class ApiBaseHelper {
  // final String _baseUrl = 'http://coddy.ir';
  // final String mainUrl = 'coddy.ir';

  // Future<dynamic> get(String url, {String query = ''}) async {
  //   try {
  //     final Uri address = Uri(
  //         host: mainUrl, scheme: "https", query: query, path: url);
  //     Map<String, String>? headers;
  //
  //     final response = await http.get(address, headers: headers);
  //     var responseJson = _returnResponse(response);
  //     return responseJson;
  //   } on SocketException {
  //     throw FetchDataException('No Internet connection');
  //   }
  // }

  FutureOr<dynamic> post(String url, dynamic body) async {
    try {
      final Uri address =
      Uri.parse(url);
      Map<String, String> headers;
      headers = {
        'Content-Type': 'application/json; charset=UTF-8',
      };
      http.Response response = await http.post(address, body: body, headers: headers);
      return response;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

}

http.Response _returnResponse(http.Response response) {
  return response;
  // switch (response.statusCode) {
  //   case 200:
  //     var responseJson = json.decode(response.body.toString());
  //     print(responseJson);
  //     return responseJson;
  //   case 400:
  //     throw BadRequestException(response.body.toString());
  //   case 401:
  //   case 403:
  //     throw UnauthorisedException(response.body.toString());
  //   case 500:
  //   default:
  //     throw FetchDataException(
  //         'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  // }
}