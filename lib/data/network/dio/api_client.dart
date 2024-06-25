import 'package:dio/dio.dart';

class ApiClient {
  static final ApiClient _singleton = ApiClient._internal();
  static Dio? _dio;

  factory ApiClient() {
    if (_dio == null) {
      _dio = Dio();
          // 'http://192.168.2.138:8000/api';
      _dio!.options.baseUrl = 'https://hs1olabx9a.sharedwithexpose.com/api';
      _dio!.options.contentType = Headers.jsonContentType;
      _dio!.options.connectTimeout = const Duration(seconds: 10);
      _dio!.options.receiveTimeout = const Duration(seconds: 10);
    }
    return _singleton;
  }

  ApiClient._internal();

  Dio get dio => _dio!;
}
