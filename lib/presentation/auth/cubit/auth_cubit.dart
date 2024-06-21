import 'dart:async';

import 'package:bongtuyettrang/domain/requests/auth/login_request.dart';
import 'package:bongtuyettrang/domain/requests/auth/register_request.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/network/repository/authentication_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthenticationRepository authenticationRepository;

  AuthCubit({required this.authenticationRepository})
      : super(const AuthState(token: '', statusCode: 0, isLoading: false));

  Future<void> login(LoginRequest loginRequest) async {
    emit(state.copyWith(isLoading: true));
    try {
      final response = await authenticationRepository.login(loginRequest);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', response.token ?? '');
      emit(AuthState(
          token: response.token ?? '',
          isLoading: false,
          statusCode: response.statusCode));
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> signUp(RegisterRequest registerRequest) async {
    emit(state.copyWith(isLoading: true));
    try {
      final response = await authenticationRepository.signUp(registerRequest);
      emit(AuthState(
          token: response.token ?? '',
          isLoading: false,
          statusCode: response.statusCode));
    } catch (e) {
      emit(state.copyWith(isLoading: false, statusCode: 422));
    }
  }
}
