import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'http_exception.dart';

class ApiBaseHelper {

  FutureOr<dynamic> post(Uri url, {String? body, required Map<String, String> headers}) async {
    try {

      http.Response response = await http.post(url, body: body, headers: headers);

      var responseJson = _returnResponse(response);

      return responseJson;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  // Future<dynamic> get(dynamic body) async {
  //   try {
  //
  //     final Uri address = Uri(
  //         host: "https://repb.raahbartrust.ir:8081/api/CaDashboard/GetAll", scheme: "https", port: 8081);
  //
  //     Map<String, String> headers;
  //     headers = {
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     };
  //
  //     final response = await http.get(address, headers: headers);
  //     var responseJson = _returnResponse(response);
  //     return responseJson;
  //   } on SocketException {
  //     throw FetchDataException('No Internet connection');
  //   }
  // }
}

http.Response _returnResponse(http.Response response) {
  return response;
}