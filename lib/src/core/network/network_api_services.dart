import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../error/app_exception.dart';
import 'base_api_services.dart';

class NetworkApiServices extends BaseApiServices {
  static var client = http.Client();
  // base API
  final String baseApi = 'https://techtest.youapp.ai';

  // get api
  @override
  Future<dynamic> getApi(String url) async {
    if (kDebugMode) {
      print(url);
    }

    dynamic responseJson;
    try {
      final response =
          await client.get(Uri.parse(url)).timeout(const Duration(seconds: 30));
      responseJson = returnResponce(response);
    } on SocketException {
      throw InternetException();
    } on RequestTimeOut {
      throw RequestTimeOut("");
    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  //post api
  @override
  Future<dynamic> postApi(var data, String url) async {
    if (kDebugMode) {
      print("api url :- ${url.toString()}");
      print("data :- ${data.toString()}");
    }

    dynamic responseJson;
    final String jsonString = jsonEncode(data);
    try {
      final response = await http
          .post(
            Uri.parse(url),
            headers: {'Content-Type': 'application/json'},
            body: jsonString,
          )
          .timeout(const Duration(seconds: 30));
      responseJson = returnResponce(response);
    } on SocketException {
      throw InternetException();
    } on RequestTimeOut {
      throw RequestTimeOut("");
    }
    return responseJson;
  }

  // put api
  Future<dynamic> putHeaderApi(
      {required Map<String, String>? header,
      required Object? data,
      required String url}) async {
    if (kDebugMode) {
      print(url);
      print(data);
    }
    dynamic responseJson;
    final String jsonString = jsonEncode(data);
    try {
      final response = await http
          .put(Uri.parse(url), headers: header, body: jsonString)
          .timeout(const Duration(seconds: 60));
      responseJson = returnResponce(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut("");
    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  Future<dynamic> getHeaderApi(
      {required Map<String, String>? header,
      // required Object? data,
      required String url}) async {
    if (kDebugMode) {
      print(url);
      // print(data);
    }
    dynamic responseJson;
    // final String jsonString = jsonEncode(data);
    try {
      final response = await http
          .post(
            Uri.parse(url),
            headers: header,
          )
          .timeout(const Duration(seconds: 60));
      responseJson = returnResponce(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut("");
    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  // handling responce
  dynamic returnResponce(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 201:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 400:
        dynamic responseJson = jsonDecode(response.body);
        debugPrint("Server Responce 400 :- ${responseJson.toString()}");
        return responseJson;

      case 401:
        dynamic responseJson = jsonDecode(response.body);
        debugPrint("Server Responce 401 :- ${responseJson.toString()}");

      case 404:
        dynamic responseJson = jsonDecode(response.body);
        debugPrint("Server Responce 404 :- ${responseJson.toString()}");

        return responseJson;
      case 422:
        dynamic responseJson = jsonDecode(response.body);
        debugPrint("Server Responce 422 :- ${responseJson.toString()}");
        return responseJson;

      default:
        throw FetchDataException(response.statusCode.toString());
    }
  }
}
