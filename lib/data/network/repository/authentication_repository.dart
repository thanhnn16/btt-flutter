import 'dart:async';
import 'package:bongtuyettrang/data/responses/auth/user_response.dart';
import '../dio/api_client.dart';

class AuthenticationRepository {
  final apiClient = ApiClient();

  Future<UserResponse> signUp({
    required String fullName,
    required String phoneNumber,
    required String password,
  }) async {
    final response = await apiClient.dio.post('/register', data: {
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'password': password,
    });
    return UserResponse.fromJson(response.data);
  }

  Future<UserResponse> login({
    required String phoneNumber,
    required String password,
  }) async {
    print('Repository login data: $phoneNumber, $password');
    final response = await apiClient.dio.post('/login', data: {
      'phoneNumber': phoneNumber,
      'password': password,
    });
    print('Repository login response: ${response.data}');
    return UserResponse.fromJson(response.data);
  }
}
