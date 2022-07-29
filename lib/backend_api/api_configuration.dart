import 'package:dio/dio.dart';

class ApiConfiguration {
  static Dio dio({String? token}) {
    Map<String, String> header = {
      "content-type": "application/json",
    };
    var options = BaseOptions(
      baseUrl: 'http://192.168.1.48:5000/',
      connectTimeout: 10000,
      receiveTimeout: 10000,
      headers: header
    );
    Dio dio = Dio(options);
    return dio;
  }
}
