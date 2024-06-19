import 'package:dio/dio.dart';

// // Sample dio client
//
// class ApiClient {
//   Dio api = Dio()
//       ..options.baseUrl = 'https://666ffd680900b5f87248efdb.mockapi.io/api/'
//       ..options.connectTimeout = const Duration(seconds: 10)
//       ..options.receiveTimeout = const Duration(seconds: 10);
// }

class ApiClient {
  static final ApiClient _singleton = ApiClient._internal();
  static Dio? _dio;

  factory ApiClient() {
    if (_dio == null) {
      _dio = Dio();
      _dio!.options.baseUrl = 'https://666ffd680900b5f87248efdb.mockapi.io/api/';
      _dio!.options.connectTimeout = const Duration(seconds: 10);
      _dio!.options.receiveTimeout = const Duration(seconds: 10);
    }
    return _singleton;
  }

  ApiClient._internal();

  Dio get dio => _dio!;
}


// Q: how to use this class?
// A: You can use this class to make network requests. For example:
//
// ```dart
// final apiClient = ApiClient();
// final response = await apiClient.dio.get('/users');