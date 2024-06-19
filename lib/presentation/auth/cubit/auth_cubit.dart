import 'dart:async';

import 'package:bongtuyettrang/data/responses/auth/user_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/network/repository/authentication_repository.dart';
import '../../../data/network/repository/user_repository.dart';
import '../../../domain/models/user.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthenticationRepository authenticationRepository;
  final UserRepository userRepository;

  AuthCubit(
      {required this.authenticationRepository, required this.userRepository})
      : super(AuthState(user: User.empty, isLoading: false));

  Future<void> signUp({
    required String fullName,
    required String phoneNumber,
    required String password,
  }) async {
    emit(state.copyWith(isLoading: true));
    try {
      UserResponse userResponse = await authenticationRepository.signUp(
        fullName: fullName,
        phoneNumber: phoneNumber,
        password: password,
      );
      emit(AuthState(user: userResponse.toModel(), isLoading: false));
      emit(state.copyWith(isLoading: false));
    } catch (e) {
      // TODO: handle error
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> login({
    required String phoneNumber,
    required String password,
  }) async {
    emit(state.copyWith(isLoading: true));
    try {
      UserResponse userResponse = await authenticationRepository.login(
        phoneNumber: phoneNumber,
        password: password,
      );
      emit(AuthState(user: userResponse.toModel(), isLoading: false));
    } catch (e) {
      // TODO: handle error
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> getUser() async {
    emit(state.copyWith(isLoading: true));
    try {
      UserResponse userResponse = await userRepository.getUser();
      emit(AuthState(user: userResponse.toModel(), isLoading: false));
    } catch (e) {
      // TODO: handle error
      emit(state.copyWith(isLoading: false));
    }
  }
}
