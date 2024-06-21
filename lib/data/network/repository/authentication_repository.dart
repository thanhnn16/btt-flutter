import 'dart:async';
import 'package:bongtuyettrang/data/responses/auth/auth_response.dart';
import 'package:bongtuyettrang/domain/requests/auth/login_request.dart';
import 'package:bongtuyettrang/domain/requests/auth/register_request.dart';
import '../dio/api_client.dart';

class AuthenticationRepository {
  final apiClient = ApiClient();

  Future<AuthResponse> signUp(RegisterRequest registerRequest) async {
    final response =
        await apiClient.dio.post('/auth/register', data: registerRequest.toJson());
    return AuthResponse.fromJson(response.data);
  }

  Future<AuthResponse> login(LoginRequest loginRequest) async {
    final response =
        await apiClient.dio.post('/auth/login', data: loginRequest.toJson());
    return AuthResponse.fromJson(response.data);
  }
}
